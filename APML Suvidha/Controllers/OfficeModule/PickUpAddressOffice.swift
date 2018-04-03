//
//  PickUpAddressOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class PickUpAddressOffice: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var floorCountLbl: UILabel!
    @IBOutlet weak var liftSwitch: UISwitch!
    @IBOutlet weak var plantSwitch: UISwitch!
    @IBOutlet weak var selectAreaLbl: UILabel!
    @IBOutlet weak var enterAddressTxtField: UITextField!
    
    //MARK: - UIViewController Method
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
       
    }
    
    //MARK: - IBOutlet Method
    
    @IBAction func plusClcikedBtn(_ sender: Any) {
    }
    @IBAction func minusClickedBtn(_ sender: Any) {
    }
    @IBAction func backCLickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func selectAreaClcikedBtn(_ sender: Any) {
    }
    
    //MARK: - Custom Method
    
    
}
