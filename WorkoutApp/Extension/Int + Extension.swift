//
//  Int + Extension.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 22.05.2023.
//

import Foundation

extension Int {
    
    func getTimeFromSeconds() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60) min"
        }
        
        return "\(self / 60) min \(self % 60) sec"
    }
}
