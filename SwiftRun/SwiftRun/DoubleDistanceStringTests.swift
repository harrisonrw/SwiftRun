//
//  DoubleDistanceStringTests.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

class DoubleDistanceStringTests: XCTestCase {

    func testToDistanceString() {

        let distance1: Double = 0.0 // meters
        XCTAssertTrue(distance1.toDistanceString() == "0.00")

        let distance2: Double = 100.0 // meters
        XCTAssertTrue(distance2.toDistanceString() == "328.08 ft")

        let distance3: Double = 5000.0 // meters
        XCTAssertTrue(distance3.toDistanceString() == "3.11 mi")
    }

}
