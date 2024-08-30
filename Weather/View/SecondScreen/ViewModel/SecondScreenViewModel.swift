//
//  SecondScreenViewModel.swift
//  Weather
//
//  Created by Mohamed Ayman on 30/08/2024.
//

import Foundation

class SecondScreenViewModel {
    let hours: [Current]
    let localTime: String
    let isDay: Bool
    let title: String
    
    init(hours: [Current], localTime: String, isDay: Bool, title: String) {
        self.hours = hours
        self.localTime = localTime
        self.isDay = isDay
        self.title = title
    }
    
    func getCurrentTime(index: Int) -> String? {
        return DateFormat.timeIn12HoursOrNow(from: hours[index].time ?? "2024-08-30 00:00", localTime: localTime)
    }
}
