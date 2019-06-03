//
//  ActivityViewModel.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

class ActivityViewModel {

    private lazy var dateComponentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [ .hour, .minute, .second ]
        return formatter
    }()

    struct Actions {
        var startEnabled: Bool
        var stopEnabled: Bool
    }

    // MARK: - State

    struct State {
        var duration: String
        var distance: String
        var actions: Actions

        var startBackgroundColor: UIColor {
            return actions.startEnabled ?
                UIColor(red: 0.0/255.0, green: 183.0/255.0, blue: 0.0/255.0, alpha: 1.0) : .darkGray
        }

        var startTitleColor: UIColor {
            return actions.startEnabled ? .white : .lightGray
        }

        var stopBackgroundColor: UIColor {
            return actions.stopEnabled ?
                UIColor(red: 192.0/255.0, green: 21.0/255.0, blue: 21.0/255.0, alpha: 1.0) : .darkGray
        }

        var stopTitleColor: UIColor {
            return actions.stopEnabled ? .white : .lightGray
        }
    }

    private static let initialState = State(
        duration: "0:00:00",
        distance: "0.00",
        actions: Actions(
            startEnabled: true,
            stopEnabled: false
        )
    )
    var state: State = initialState {
        didSet {
            callback(state)
        }
    }

    // MARK: - Callback

    // Use this to handle view model updates in the caller.
    var callback: ((State) -> Void)

    // MARK: - Initialization

    /**
     Initialize the view model with specified `callback`.

     The `callback` is called when the state is updated.
     */
    init(callback: @escaping (State) -> Void) {
        self.callback = callback
        self.callback(state)
    }

    // MARK: - Methods

    /**
     Resets to the initial state.
     */
    func reset() {
        var state = self.state
        state.duration = "0:00:00"
        state.distance = "0.00"
        state.actions = Actions(
            startEnabled: true,
            stopEnabled: false
        )
        self.state = state
    }

    /**
     Update the state with the specified `activity`.

     - Important:
     If `activity` is nil, then the state is reset. The `callback` is called on completion.
     */
    func update(with activity: Activity?) {

        guard let activity = activity else {
            reset()
            return
        }

        var state = self.state
        state.duration = dateComponentsFormatter.string(from: activity.duration)!
        state.distance = activity.distance.toDistanceString()

        state.actions = getActions(for: activity)

        self.state = state
    }

    /**
     Update the actions with the specified `activity`.
     */
    func getActions(for activity: Activity) -> Actions {

        switch activity.activityState {

        case .active:
            return Actions(
                startEnabled: false,
                stopEnabled: true
            )

        case .complete:
            return Actions(
                startEnabled: true,
                stopEnabled: false
            )

        }

    }
}
