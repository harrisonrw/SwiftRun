//
//  ActivityViewModelTests.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

final class ActivityViewModelTests: XCTestCase {

    func testInit() {

        let callbackExpectation = expectation(description: "ActivityViewModel Init")

        let viewModel = ActivityViewModel { state in

            XCTAssertEqual(state.duration, "0:00:00")
            XCTAssertTrue(state.actions.startEnabled)
            XCTAssertFalse(state.actions.stopEnabled)
            XCTAssertTrue(state.startBackgroundColor.isEqual(UIColor(red: 0.0/255.0, green: 183.0/255.0, blue: 0.0/255.0, alpha: 1.0)))
            XCTAssertTrue(state.startTitleColor.isEqual(UIColor.white))
            XCTAssertTrue(state.stopBackgroundColor.isEqual(UIColor.darkGray))
            XCTAssertTrue(state.stopTitleColor.isEqual(UIColor.lightGray))

            callbackExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertNotNil(viewModel)
    }

    func testUpdateWithActiveActivity() {

        let callbackExpectation = expectation(description: "ActivityViewModel Update With Active")

        let viewModel = ActivityViewModel { state in

            if state.duration != "0:00:00" {

                XCTAssertEqual(state.duration, "0:30:00")
                XCTAssertFalse(state.actions.startEnabled)
                XCTAssertTrue(state.actions.stopEnabled)
                XCTAssertTrue(state.startBackgroundColor.isEqual(UIColor.darkGray))
                XCTAssertTrue(state.startTitleColor.isEqual(UIColor.lightGray))
                XCTAssertTrue(state.stopBackgroundColor.isEqual(UIColor(red: 192.0/255.0, green: 21.0/255.0, blue: 21.0/255.0, alpha: 1.0)))
                XCTAssertTrue(state.stopTitleColor.isEqual(UIColor.white))

                callbackExpectation.fulfill()

            }
        }

        let activity = Activity(
            date: Date(),
            duration: 1800.0,
            distance: 5000.0,
            activityState: .active
        )
        viewModel.update(with: activity)

        waitForExpectations(timeout: 5, handler: nil)

    }

    func testUpdateWithStoppedActivity() {

        let callbackExpectation = expectation(description: "ActivityViewModel Update With Stopped")

        let viewModel = ActivityViewModel { state in

            if state.duration != "0:00:00" {

                XCTAssertEqual(state.duration, "0:30:00")
                XCTAssertTrue(state.actions.startEnabled)
                XCTAssertFalse(state.actions.stopEnabled)
                XCTAssertTrue(state.startBackgroundColor.isEqual(UIColor(red: 0.0/255.0, green: 183.0/255.0, blue: 0.0/255.0, alpha: 1.0)))
                XCTAssertTrue(state.startTitleColor.isEqual(UIColor.white))
                XCTAssertTrue(state.stopBackgroundColor.isEqual(UIColor.darkGray))
                XCTAssertTrue(state.stopTitleColor.isEqual(UIColor.lightGray))

                callbackExpectation.fulfill()
            }
        }

        let activity = Activity(
            date: Date(),
            duration: 1800.0,
            distance: 5000.0,
            activityState: .complete
        )
        viewModel.update(with: activity)

        waitForExpectations(timeout: 5, handler: nil)

    }

}
