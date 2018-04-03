//
//  ChangeNoTwo.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ChangeNoTwo: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
