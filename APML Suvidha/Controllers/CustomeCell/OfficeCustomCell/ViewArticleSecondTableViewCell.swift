//
//  ViewArticleSecondTableViewCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ViewArticleSecondTableViewCell: UITableViewCell{
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var enterValueTextField: UITextField!
    @IBOutlet weak var qantityLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUpLayout(list: ViewArticleFinalReview , cell: ViewArticleSecondTableViewCell)  {
        itemNameLbl.text = list.itemName
        enterValueTextField.text = list.itemValue
        qantityLbl.text = list.itemQuantity
    }
}
