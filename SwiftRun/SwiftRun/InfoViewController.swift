//
//  InfoViewController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 6/3/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Configuration

    /**
     Returns an instance loaded from a storyboard and configured.
     */
    static func configured() -> InfoViewController {
        let storyboard = UIStoryboard(name: "Info", bundle: nil)

        let viewController = storyboard.instantiateViewController(
            withIdentifier: "InfoViewController"
        ) as! InfoViewController

        return viewController
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Information"

    }


}
