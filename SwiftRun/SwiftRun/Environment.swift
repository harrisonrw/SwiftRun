//
//  Environment.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import CoreLocation

class Environment {

    let locationManager: LocationManager

    init(locationManager: LocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }

}
