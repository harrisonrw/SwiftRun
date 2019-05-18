//
//  LocationManager.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManager {

    // CLLocationManager Properties
    var location: CLLocation? { get }
    var delegate: CLLocationManagerDelegate? { get set }
    var distanceFilter: CLLocationDistance { get set }
    var pausesLocationUpdatesAutomatically: Bool { get set }
    var allowsBackgroundLocationUpdates: Bool { get set }

    // CLLocationManager Methods
    func requestWhenInUseAuthorization()
    func startUpdatingLocation()
    func stopUpdatingLocation()

    // Wrappers for CLLocationManager class functions.
    func getAuthorizationStatus() -> CLAuthorizationStatus
    func isLocationServicesEnabled() -> Bool
}
