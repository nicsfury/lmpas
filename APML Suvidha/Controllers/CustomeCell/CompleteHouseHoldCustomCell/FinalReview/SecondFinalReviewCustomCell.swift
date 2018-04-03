//
//  SecondFinalReviewCustomCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 30/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class SecondFinalReviewCustomCell: UITableViewCell{
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var enterPriceTxtField: UITextField!
    @IBOutlet weak var articleNameLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
