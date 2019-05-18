//
//  NavigationCoordinator.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation
import UIKit

class NavigationCoordinator {

    static let shared = NavigationCoordinator()

    let navigationController: ApplicationNavigationController

    private var environment: Environment!

    required init() {
        navigationController = ApplicationNavigationController.configured()
    }

    func getRootViewController(withEnvironment environment: Environment) -> UIViewController {
        self.environment = environment
        presentActivity(animated: false)
        return navigationController
    }

    func presentActivity(animated: Bool) {
        let activityViewController = ActivityViewController.configured(
            environment: environment
        )
        navigationController.setViewControllers([activityViewController], animated: animated)
    }

}