//
//  ActivityLogicControllerTests.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

final class ActivityLogicControllerTests: BaseTestCase {

    func testInitialization() {
        let activityLogicController = ActivityLogicController(environment: environment)
        XCTAssertNotNil(activityLogicController)
    }

    func testStartActivity() {

        let activityLogicController = ActivityLogicController(environment: environment)

        let startExpectation = expectation(description: "ActivityLogicController Start Activity")

        activityLogicController.startActivity { activity, error in

            XCTAssertNotNil(activity)
            XCTAssertTrue(activity!.activityState == .active)
            XCTAssertNil(error)

            startExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

    }

    func testStopActivity() {

        let stopExpectation = expectation(description: "ActivityLogicController Stop Activity")

        let activityLogicController = ActivityLogicController(environment: environment)

        activityLogicController.startActivity { _, _ in

            activityLogicController.stopActivity { activity in

                XCTAssertNotNil(activity)
                XCTAssertTrue(activity!.activityState == .complete)

                stopExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

}
