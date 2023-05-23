//
//  Date + Extension.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 23.05.2023.
//

import Foundation

extension Date {
    
    func getWeekDayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
