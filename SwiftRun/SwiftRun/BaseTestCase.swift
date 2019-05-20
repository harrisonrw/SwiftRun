//
//  BaseTestCase.swift
//  SwiftRunTests
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import XCTest
@testable import SwiftRun

class BaseTestCase: XCTestCase {

    var environment: Environment!

    // MARK: - Setup & TearDown

    override func setUp() {
        super.setUp()
        environment = Environment(locationManager: MockLocationManager())
    }

    override func tearDown() {
        environment = nil
        super.tearDown()
    }

}
