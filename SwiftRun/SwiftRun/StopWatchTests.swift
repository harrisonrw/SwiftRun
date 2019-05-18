//
//  StopWatchTests.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

final class StopWatchTests: XCTestCase {

    func testStart() {

        let stopWatch = StopWatch()

        let startExpectation = expectation(description: "StopWatch Start")

        stopWatch.start {

            XCTAssertNotNil(stopWatch.startTime)

            startExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testStop() {

        let stopWatch = StopWatch()

        stopWatch.start { }

        wait(for: 1)

        let stopExpectation = expectation(description: "StopWatch Stop")

        stopWatch.stop {

            XCTAssertTrue(stopWatch.accumulatedTime > 0.0)
            XCTAssertNil(stopWatch.startTime)

            stopExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testReset() {
        let stopWatch = StopWatch()
        stopWatch.accumulatedTime = 500.0

        stopWatch.reset()

        XCTAssertTrue(stopWatch.accumulatedTime == 0.0)
    }
}
