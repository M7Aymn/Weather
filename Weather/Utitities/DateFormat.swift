//
//  DateFormat.swift
//  Weather
//
//  Created by Mohamed Ayman on 22/08/2024.
//

import Foundation

struct DateFormat {
    
    static func dayOfWeek(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else {
            dateFormatter.dateFormat = "EEEE"
            return String(dateFormatter.string(from: date).prefix(3))
        }
    }
    
    static func timeIn12HoursOrNow(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        let calendar = Calendar.current
        let currentDate = Date()
        
        let currentHour = calendar.component(.hour, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        let givenHour = calendar.component(.hour, from: date)
        let givenDay = calendar.component(.day, from: date)
        
        if currentDay == givenDay && givenHour == currentHour {
            return "Now"
        } else if !(currentDay == givenDay && givenHour < currentHour) {
            dateFormatter.dateFormat = "h a"
            return dateFormatter.string(from: date)
        }
        
        return nil
    }

}
