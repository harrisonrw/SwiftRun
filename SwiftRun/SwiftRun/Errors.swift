//
//  Errors.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation

protocol AppErrorType: Error, CustomDebugStringConvertible { }

/**
 Errors in the app.
 */
enum AppError: AppErrorType {

    case unimplemented

    var debugDescription: String {
        switch self {
        case .unimplemented:
            return "Method unimplemented"
        }
    }

    enum Location: AppErrorType {
        case locationServicesDisabled
        case locationAuthorizationNotDetermined

        var debugDescription: String {
            switch self {
            case .locationServicesDisabled:
                return "Location Services is disabled. Please enable Location Services."
            case .locationAuthorizationNotDetermined:
                return "Location Services authorization status is not determined."
            }
        }
    }
}
