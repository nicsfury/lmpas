//
//  ViewArticleFirstOfficeTableviewCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ViewArticleFirstOfficeTableviewCell: UITableViewCell{
    
    @IBOutlet weak var catIdLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpLayout(list: ViewArticleFinalReview , cell: ViewArticleFirstOfficeTableviewCell)  {
        catIdLbl.text = list.catName
    }
}
