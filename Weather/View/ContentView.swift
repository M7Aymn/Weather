//
//  ContentView.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import SwiftUI

struct ContentView: View {
    var isDay: Bool = true
    var body: some View {
        NavigationStack{
            ZStack {
                (isDay ? Image(.day) : Image(.night))
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width)
                
                VStack {
                    VStack {
                        Text("Cairo") .bold()
                        Text("21°") .bold()
                        Text("Partly Cloudy")
                        Text("H:16° L:6°")
                        Image(systemName: "cloud")
                    }
                    .font(.title)
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("3-DAY FORECAST")
                        Divider().background(.black)
                        
                        
                        NavigationLink {
                            DayView()
                        } label: {
                            HStack {
                                Text("Today")
                                    .frame(width: 66, alignment: .leading)
                                Image(systemName: "cloud")
                                Text("7.8° - 15.5°")
                                    .frame(width: 100, alignment: .trailing)
                            }
                            .padding(.vertical, 2)
                        }
                        
                        Divider().background(.black)
                        
                        NavigationLink {
                            DayView()
                        } label: {
                            HStack {
                                Text("Wed")
                                    .frame(width: 66, alignment: .leading)
                                Image(systemName: "cloud")
                                Text("7.8° - 15.5°")
                                    .frame(width: 100, alignment: .trailing)
                            }
                            .padding(.vertical, 2)
                        }
                        
                        Divider().background(.black)
                        
                        NavigationLink {
                            DayView()
                        } label: {
                            HStack {
                                Text("Thu")
                                    .frame(width: 66, alignment: .leading)
                                Image(systemName: "cloud")
                                Text("7.8° - 15.5°")
                                    .frame(width: 100, alignment: .trailing)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .font(.title3)
                    .frame(width: 220)
                    .padding()
                    
                    HStack {
                        Spacer()
                        VStack {
                            Text("VISIBILITY")
                                .padding()
                            Text("10 Km")
                                .font(.title)
                                .padding(.bottom, 20)
                            
                            
                            Text("FEELS LIKE")
                                .padding()
                            
                            Text("16°")
                                .font(.title)
                                .padding(.bottom, 20)
                        }
                        Spacer()
                        VStack {
                            Text("HUMIDITY")
                                .padding()
                            
                            Text("36%")
                                .font(.title)
                                .padding(.bottom, 20)
                            
                            Text("PRESSURE")
                                .padding()
                            
                            Text("1,021")
                                .font(.title)
                                .padding(.bottom, 20)
                            
                        }
                        Spacer()
                    }
                    
                    
                    
                    
                    
                }
                .padding()
                .foregroundStyle(isDay ? .black : .white)
            }
        }
//        .task {
//            NetworkService.load { Weather in
//                print(Weather.current)
//            }
//        }
    }
}

#Preview {
    ContentView()
}
