//
//  FinalReviewCarAndBikeTableViewCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FinalReviewCarAndBikeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var moveDateLbl: UILabel!
    @IBOutlet weak var destinationAddressLbl: UILabel!
    @IBOutlet weak var pickUpAddressLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        func setUpLayout(){
            moveDateLbl.text = AppUserDefaults.value(forKey: .ExpectedMoveDateComplete, fallBackValue: "").string!
            
            pickUpAddressLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
            
            destinationAddressLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
            
        }
    
}
