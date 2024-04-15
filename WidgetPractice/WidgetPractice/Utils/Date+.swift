//
//  Date+.swift
//  WidgetPractice
//
//  Created by 현수빈 on 4/15/24.
//

import Foundation

extension TimeInterval {
    var tohour: Double {
        Double(self) / 3600
    }
}


public extension String {
    func stringToDate() -> Date? {
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define date format
        
        // Convert String to Date
        let date = dateFormatter.date(from: self)
        
        return date
    }
}

public extension Date {
    
    func dateToString() -> String {
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define date format
        
        // Convert Date to String
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
}
