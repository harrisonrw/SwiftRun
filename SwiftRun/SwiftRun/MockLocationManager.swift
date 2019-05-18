//
//  MockLocationManager.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import CoreLocation

class MockLocationManager: LocationManager {

    var location: CLLocation? = CLLocation(
        latitude: 37.3317,
        longitude: -122.0325086
    )

    var delegate: CLLocationManagerDelegate?
    var distanceFilter: CLLocationDistance = 10
    var pausesLocationUpdatesAutomatically = false
    var allowsBackgroundLocationUpdates = true

    func requestWhenInUseAuthorization() { }
    func startUpdatingLocation() { }
    func stopUpdatingLocation() { }

    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return .authorizedWhenInUse
    }

    func isLocationServicesEnabled() -> Bool {
        return true
    }
}
