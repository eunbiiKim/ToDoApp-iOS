//
//  DateTool.swift
//  ToDo
//
//  Created by Meo MacBook Pro on 27/06/2019.
//  Copyright © 2019 Busan iOS. All rights reserved.
//

import Foundation

struct MonthDay {
    var month: String
    var day: String
    
    var date: String {
        return "\(month)/\(day)"
    }
    
    init(inputMonth: String, inputDay: String) {
        month = inputMonth
        day = inputDay
    }
}

class DateTool {
    
    func findWeek() -> [Int:MonthDay]? {
        
        var monthDayDictionary = [Int:MonthDay]()
        let date = Date()
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.autoupdatingCurrent
        
        let todayInfomation = calendar.dateComponents([.weekday], from: date)
        
        guard let todayWeek = todayInfomation.weekday else {
            return nil
        }
        
        for index in 1 ... 7 {
            monthDayDictionary[index] = calcDay(addIngDay: -(todayWeek - index)).covertTimezone()
        }
        
        return monthDayDictionary
    }
    
    func calcDay(addIngDay: Int) -> Date {
        
        let addingDay = DateComponents(day: addIngDay)
        
        if let endDay = Calendar.current.date(byAdding: addingDay, to: Date()) {
            return endDay
        }
        
        return Date()
    }
}
extension Date {
    
    func covertTimezone() -> MonthDay? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        
        guard let currentLocale = Locale.preferredLanguages.first else {
            return nil
        }
        dateFormatter.locale = Locale(identifier: currentLocale)
        
        return dateFormatter.string(from: self).separateSpace()
    }
    
    
}
extension String {
    
    func separateSpace()  -> MonthDay? {
        let stringMonthDay = self.components(separatedBy: .whitespaces)
        return MonthDay(inputMonth: stringMonthDay[0], inputDay: stringMonthDay[1])
    }
}

