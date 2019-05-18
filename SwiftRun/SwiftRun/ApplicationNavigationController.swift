//
//  ApplicationNavigationController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/17/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

/**
 Navigation controller providing application specific styles.
 */
class ApplicationNavigationController: UINavigationController {

    /**
     Returns an instance loaded from a storyboard and configured.
     */
    static func configured() -> ApplicationNavigationController {

        let storyboard = UIStoryboard(name: "ApplicationNavigation", bundle: nil)

        let controller = storyboard.instantiateViewController(
            withIdentifier: "ApplicationNavigationController"
        ) as! ApplicationNavigationController

        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarStyle()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
         return UIStatusBarStyle.lightContent
    }

    func configureNavigationBarStyle() {

        // BarButtonItem Color.
        navigationBar.tintColor = .white

        // Title Color/Font.
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20.0, weight: .bold)
        ]

        // Transparent Navigation Bar.
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }

}
