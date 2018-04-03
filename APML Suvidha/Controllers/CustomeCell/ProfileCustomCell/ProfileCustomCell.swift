//
//  ProfileCustomCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ProfileCustomCell: UITableViewCell{
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var alternateMobileNumberTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var locationTxtField: UITextField!
    
    @IBOutlet weak var updateBtn: UIButton!
    
    @IBOutlet weak var annivesaryBtn: UIButton!
    @IBOutlet weak var dateOfBirthBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
