//
//  WorkoutModel.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 23.05.2023.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknown"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0 // seconds
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}
