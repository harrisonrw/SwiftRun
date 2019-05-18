//
//  StopWatch.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation

class StopWatch {

    var startTime: Date?
    var accumulatedTime: TimeInterval = 0.0

    var elapsedTimeInterval: TimeInterval {
        return self.accumulatedTime + Date().timeIntervalSince(self.startTime ?? Date())
    }

    func start(completion: @escaping () -> Void) {
        startTime = Date()
        completion()
    }

    func stop(completion: @escaping () -> Void) {
        accumulatedTime += Date().timeIntervalSince(startTime ?? Date())
        startTime = nil
        completion()
    }

    func reset() {
        accumulatedTime = 0.0
    }

}
