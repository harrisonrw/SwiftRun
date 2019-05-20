//
//  ActivityViewController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var distanceLabel: UILabel!
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var stopButton: UIButton!

    private var environment: Environment!
    private var activityLogicController: ActivityLogicController!

    // MARK: - Configuration

    /**
     Returns an instance loaded from a storyboard and configured.
     */
    static func configured(environment: Environment,
                           activityLogicController: ActivityLogicController) -> ActivityViewController {
        let storyboard = UIStoryboard(name: "Activity", bundle: nil)

        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ActivityViewController"
        ) as! ActivityViewController

        viewController.environment = environment
        viewController.activityLogicController = activityLogicController

        return viewController
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SwiftRun"
    }

    // MARK: - Actions

    @IBAction func start() {

    }

    @IBAction func stop() {

    }
}
