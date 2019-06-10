//
//  LicenseViewController.swift
//  SwiftRun
//
//  Created by Robert Harrison on 6/10/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet private var textView: UITextView!

    /**
     Returns an instance loaded from a storyboard and configured.
     */
    static func configured() -> LicenseViewController {
        let storyboard = UIStoryboard(name: "License", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "LicenseViewController"
        ) as! LicenseViewController
        return viewController
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "License"

        textView.text = """
        MIT License

        Copyright (c) 2019 Robert Harrison

        Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the right to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
        """

    }

}
