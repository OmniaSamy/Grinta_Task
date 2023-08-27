//
//  TimeDateFormat.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

class TimeDateFormat {
    
    class func convertTime(time: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let newDate = dateFormatter.date(from: time) ?? Date()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = .current
        let timeString = dateFormatter.string(from: newDate)
        return timeString
    }
    
    class func convertStringToDate(date: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: date) ?? Date()
        return newDate
    }
}
