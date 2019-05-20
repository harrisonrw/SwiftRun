//
//  Activity.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation

enum ActivityState: String {
    case active
    case complete
}

class Activity {

    var date: Date
    var duration: Double         // In Seconds
    var distance: Double         // In Meters
    var activityState: ActivityState

    var endDate: Date {
        return date.addingTimeInterval(duration)
    }

    init(date: Date, duration: Double, distance: Double, activityState: ActivityState) {
        self.date = date
        self.duration = duration
        self.distance = distance
        self.activityState = activityState
    }

}
