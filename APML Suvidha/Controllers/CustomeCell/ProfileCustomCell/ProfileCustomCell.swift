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
    
    @IBOutlet weak var anniversoryLbl: UILabel!
    @IBOutlet weak var dateofBirthLbl: UILabel!
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
    
    func setCellLayout(cell: ProfileCustomCell , model: ProfileModel)  {
        cell.nameLbl.text = model.name
        cell.mobileTxtField.text = model.mobile
        cell.alternateMobileNumberTxtField.text = model.alternate
        cell.emailTxtField.text = model.email
        cell.locationTxtField.text = model.address
        cell.anniversoryLbl.text = model.anniversery
        cell.dateofBirthLbl.text = model.dob
        
    }
}
