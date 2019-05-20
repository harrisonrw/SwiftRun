//
//  ActivityLogicControllerDelegate.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/20/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import Foundation

protocol ActivityLogicControllerDelegate: class {
    func activityLogicController(_ activityLogicController: ActivityLogicController,
                                 didUpdateActivity activity: Activity)
}
