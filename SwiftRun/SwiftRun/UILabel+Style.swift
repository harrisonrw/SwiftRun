//
//  UILabel+Style.swift
//  SwiftRun
//
//  Created by Robert Harrison on 5/24/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

extension UILabel {

    func configureStyle() {

        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)

        // Monospaced Font so the digits don't move position on each iteration of the timer.
        self.font = UIFont.monospacedDigitSystemFont(ofSize: 58.0, weight: .semibold)

    }

}
