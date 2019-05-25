//
//  ActivityViewController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit
import os

class ActivityViewController: UIViewController, ActivityLogicControllerDelegate {

    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var distanceLabel: UILabel!
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var stopButton: UIButton!

    private var environment: Environment!
    private var activityLogicController: ActivityLogicController!

    private var viewModel: ActivityViewModel?

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

        durationLabel.configureStyle()
        distanceLabel.configureStyle()

        activityLogicController.delegate = self

        viewModel = ActivityViewModel { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.refreshView(with: state)
        }
        viewModel!.reset()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Prevent app from going to sleep.
        UIApplication.shared.isIdleTimerDisabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Allow app to go to sleep.
        UIApplication.shared.isIdleTimerDisabled = false
    }

    // MARK: - ViewModel Callback

    private func refreshView(with state: ActivityViewModel.State) {

        assert(Thread.isMainThread)

        durationLabel.text = state.duration
        distanceLabel.text = state.distance

        startButton.backgroundColor = state.actions.startEnabled ?
            UIColor(red: 0.0/255.0, green: 183.0/255.0, blue: 0.0/255.0, alpha: 1.0) : .darkGray

        startButton.isEnabled = state.actions.startEnabled

        stopButton.backgroundColor = state.actions.stopEnabled ?
            UIColor(red: 192.0/255.0, green: 21.0/255.0, blue: 21.0/255.0, alpha: 1.0) : .darkGray

        stopButton.isEnabled = state.actions.stopEnabled
    }

    // MARK: - Actions

    @IBAction func start() {

        activityLogicController.startActivity { [weak self] activity, error in

            guard error == nil else {
                self?.handleError(error!)
                return
            }

            self?.viewModel?.update(with: activity)
        }

    }

    @IBAction func stop() {

        activityLogicController.stopActivity { [weak self] activity in
            self?.viewModel?.update(with: activity)
        }

    }

    private func handleError(_ error: AppErrorType) {

        if case AppError.Location.locationAuthorizationNotDetermined = error {
            assert(Thread.isMainThread)
            activityLogicController.requestLocationAuthorization()
        } else {
            // TODO: Present error message to the user
            os_log("Error: %@", log: .default, type: .error, error.debugDescription)
        }
    }

    // MARK: - ActivityLogicControllerDelegate

    func activityLogicController(_ activityLogicController: ActivityLogicController,
                                 didUpdateActivity activity: Activity) {
        viewModel?.update(with: activity)
    }
}
