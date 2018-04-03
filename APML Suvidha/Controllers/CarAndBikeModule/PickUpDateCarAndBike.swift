//
//  PickUpDateCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class PickUpDateCarAndBike: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectpickupdateClikedBtn(_ sender: Any) {
        let SubmitStepVC = SubmitStepCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
        self.navigationController?.pushViewController(SubmitStepVC, animated: true)
    }
   
}
