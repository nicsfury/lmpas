//
//  faqCustomCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 03/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class faqCustomCell: UITableViewCell{
    
    @IBOutlet weak var questionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sizeToFit()
        layoutIfNeeded()
    }
}
