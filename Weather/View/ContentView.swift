//
//  ContentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var weather: Weather?
    @State private var isDay: Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack {
                (isDay == 1 ? Image(.day) : Image(.night))
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width)
                
                if let weather = weather {
                    VStack {
                        VStack {
                            Text(weather.location.name) .bold()
                            Text(String(format: "%.1f°", weather.current.tempC))
                                .bold()
                            Text("Partly Cloudy")
                            Text(
                                String(format: "H:%.1f° L:%.1f°", weather.forecast.forecastday[0].day.maxtempC, weather.forecast.forecastday[0].day.mintempC)
                            )
                            ConditionImage(urlString: "https:" + weather.current.condition.icon.rawValue)
                                .frame(width: 110, height: 110)
                                .padding(-45)
                        }
                        .font(.title)
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("3-DAY FORECAST")
                            
                            
                            
                            ForEach(weather.forecast.forecastday, id: \.date) { dayForecast in
                                Divider().background(.black)
                                
                                NavigationLink {
                                    DayView(hours: dayForecast.hour, isDay: isDay)
                                } label: {
                                    HStack {
                                        Text(DateFormat.dayOfWeek(from: dayForecast.date))
                                            .frame(width: 125, alignment: .leading)
                                        ConditionImage(urlString: "https:" + dayForecast.day.condition.icon.rawValue)
                                            .frame(width: 50, height: 50)
                                            .padding(.vertical, -10)
                                        Text(String(format: "%.1f° - %.1f°", dayForecast.day.mintempC, dayForecast.day.maxtempC)
                                        )
                                        .frame(width: 125, alignment: .trailing)
                                    }
                                    .padding(.vertical, 2)
                                }
                            }
                        }
                        .font(.title3)
                        .frame(width: 300)
                        .padding()
                        
                        HStack(spacing: 30) {
                            Spacer()
                            VStack(spacing: 5) {
                                Text("VISIBILITY")
                                    .padding(.bottom, 5)
                                Text("\(weather.current.visKM) Km")
                                    .font(.title)
                                    .padding(.bottom, 20)
                                
                                
                                Text("FEELS LIKE")
                                    .padding(.bottom, 5)
                                
                                Text(String(format: "%.1f°", weather.current.feelslikeC))
                                    .font(.title)
                                    .padding(.bottom, 20)
                            }
                            .padding(.bottom, 30)
                            Spacer()
                            
                            VStack(spacing: 5) {
                                Text("HUMIDITY")
                                    .padding(.bottom, 5)
                                
                                Text("\(weather.current.humidity)%")
                                    .font(.title)
                                    .padding(.bottom, 20)
                                
                                Text("PRESSURE")
                                    .padding(.bottom, 5)
                                
                                Text("\(weather.current.pressureMB)")
                                    .font(.title)
                                    .padding(.bottom, 20)
                                
                            }
                            .padding(.bottom, 30)
                            Spacer()
                        }
                        
                        
                        
                        
                    }
                    .padding()
                    .foregroundStyle(isDay == 1 ? .black : .white)
                } else {
                    VStack{
                        ProgressView()
                            .scaleEffect(2)
                            .frame(height: 75)
                        Text("loading ...")
                            .font(.largeTitle)
                    }
                    .task {
                        NetworkService.load { Weather in
                            self.weather = Weather
                            self.isDay = Weather.current.isDay
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
