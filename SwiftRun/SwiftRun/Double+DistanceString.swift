//
//  Double+DistanceString.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation

extension Double {

    func toDistanceString() -> String {

        // Ensure that the user has travelled atleast 2 meters.
        // Otherwise, this function will return a result in inches.
        guard self >= 2.0 else { return "0.00" }

        let formatter = MeasurementFormatter()
        formatter.unitOptions = .naturalScale
        formatter.unitStyle = .medium

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale(identifier: Locale.current.identifier)

        formatter.numberFormatter = numberFormatter

        let distanceMeasurement = Measurement(value: self, unit: UnitLength.meters)

        return formatter.string(from: distanceMeasurement)
    }
}
