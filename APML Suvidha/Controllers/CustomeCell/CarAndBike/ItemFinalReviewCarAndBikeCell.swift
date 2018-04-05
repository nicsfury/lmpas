//
//  ItemFinalReviewCarAndBikeCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ItemFinalReviewCarAndBikeCell: UITableViewCell{
    //MARK: - Properties
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var vehicleTypeLbl: UILabel!
    
    @IBOutlet weak var vehicleInsuranceValueLbl: UILabel!
    @IBOutlet weak var nameAndModelLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpLayout(cell: ItemFinalReviewCarAndBikeCell, item: CarItemModel){
        cell.vehicleTypeLbl.text = item.type
        cell.vehicleInsuranceValueLbl.text = item.value
        cell.nameAndModelLbl.text = item.name
    }
}

