//
//  CLLocationManager+Extension.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationManager: LocationManager {

    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }

    func isLocationServicesEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }

}
