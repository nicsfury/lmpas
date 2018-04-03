//
//  MenuCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 20/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var subnameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
