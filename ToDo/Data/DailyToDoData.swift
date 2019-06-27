//
//  DailyToDoData.swift
//  ToDo
//
//  Created by Meo MacBook Pro on 27/06/2019.
//  Copyright © 2019 Busan iOS. All rights reserved.
//
import Foundation

struct DailyToDoData {
    var title: String
    var content: String
    var date: Date
    var time: Date?
    var place: String?
    var alarm: String?
    var isCheck: Bool
    
    init(inputTitle: String, inputContent: String, inputDate: Date, inputTime: Date?, inputPlace: String?, inputAlarm: String?,inputCheck: Bool = false) {
        self.title = inputTitle
        self.content = inputContent
        self.date = inputDate
        self.time = inputTime
        self.place = inputPlace
        self.alarm = inputAlarm
        self.isCheck = inputCheck
    }
}
