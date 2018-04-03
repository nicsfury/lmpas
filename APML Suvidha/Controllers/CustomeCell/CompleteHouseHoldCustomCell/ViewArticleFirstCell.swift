//
//  ViewArticleFirstCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 27/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
class ViewArticleFirstCell:UITableViewCell{
    
    @IBOutlet weak var catIdLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpLayout(list: ViewArticleFinalReview , cell: ViewArticleFirstCell)  {
        catIdLbl.text = list.catName
    }
}
