//
//  otpScreen.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 20/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class otpScreen: UIViewController
{
    @IBOutlet weak var otpCodeTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func submitOtpClickedBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController") as? RAMAnimatedTabBarController
        self.navigationController?.show(vc!, sender: nil)
    }
}
