//
//  XCTestCaseExtension.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

extension XCTestCase {

    func wait(for duration: TimeInterval) {

        let waitExpectation = expectation(description: "Waiting")

        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }

        // Pad the timeout so we avoid any issues.
        waitForExpectations(timeout: duration + 0.5)
    }
}
