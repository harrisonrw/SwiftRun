//
//  ActivityLogicController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import CoreLocation

class ActivityLogicController: NSObject, CLLocationManagerDelegate {

    private var activity: Activity?
    private var stopWatch = StopWatch()
    private var timer: Timer?
    private var locationManager: LocationManager!
    private var distance = Measurement(value: 0, unit: UnitLength.meters)
    private var locationList: [CLLocation] = []

    weak var delegate: ActivityLogicControllerDelegate?

    private var environment: Environment

    // MARK: - Initialization

    required override init() {
        fatalError("Default init is not implemented.")
    }

    required init(environment: Environment) {
        self.environment = environment
        self.locationManager = environment.locationManager
        super.init()

        locationManager.delegate = self
        locationManager.distanceFilter = 10
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.allowsBackgroundLocationUpdates = true
    }

    // MARK: - Actions

    func startActivity(completion: @escaping (_ activity: Activity?, _ error: AppErrorType?) -> Void) {

        if locationManager.getAuthorizationStatus() == .notDetermined {
            completion(nil, AppError.Location.locationAuthorizationNotDetermined)
            return
        }

        locationManager.requestWhenInUseAuthorization()

        stopWatch.reset()

        stopWatch.start { [weak self] in

            assert(Thread.isMainThread)

            guard let strongSelf = self else { return }

            strongSelf.activity = Activity(
                date: strongSelf.stopWatch.startTime!,
                duration: 0.0,
                distance: 0.0,
                activityState: .active
            )

            guard strongSelf.timer == nil else { return }

            strongSelf.timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: strongSelf,
                selector: #selector(strongSelf.updateActivity),
                userInfo: nil,
                repeats: true
            )

            strongSelf.distance = Measurement(value: 0, unit: UnitLength.meters)
            strongSelf.locationList.removeAll()

            if strongSelf.locationManager.isLocationServicesEnabled() &&
                (strongSelf.locationManager.getAuthorizationStatus() == .authorizedWhenInUse ||
                 strongSelf.locationManager.getAuthorizationStatus() == .authorizedAlways) {
                 strongSelf.locationManager.startUpdatingLocation()
            }

            completion(strongSelf.activity, nil)
        }

    }

    func stopActivity(completion: @escaping (_ activity: Activity?) -> Void) {

        stopWatch.stop { [weak self] in

            assert(Thread.isMainThread)

            guard let strongSelf = self else { return }

            strongSelf.timer?.invalidate()
            strongSelf.timer = nil
            strongSelf.locationManager.stopUpdatingLocation()

            strongSelf.activity?.activityState = .complete

            completion(strongSelf.activity)
        }

    }

    @IBAction func updateActivity() {
        if activity != nil {
            activity!.duration = stopWatch.elapsedTimeInterval
            delegate?.activityLogicController(self, didUpdateActivity: activity!)
        }
    }

    // MARK: - Permissions

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        for location in locations {

            let howRecent = location.timestamp.timeIntervalSinceNow

            guard location.horizontalAccuracy >= 0 &&
                location.horizontalAccuracy < 20 &&
                abs(howRecent) < 10 else {
                    continue
            }

            if let lastLocation = locationList.last {
                let delta = location.distance(from: lastLocation)
                let previousDistance = distance
                distance = previousDistance + Measurement(value: delta, unit: UnitLength.meters)

                activity?.distance = distance.value
            }

            locationList.append(location)

        }

    }

}
