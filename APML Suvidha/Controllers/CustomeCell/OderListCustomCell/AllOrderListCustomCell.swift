//
//  AllOrderListCustomCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 15/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
class AllOrderListCustomCell: UITableViewCell {
    
    @IBOutlet weak var enquiryOnLbl: UILabel!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var moveImageView: UIImageView!
    @IBOutlet weak var moveNameLbl: UILabel!
    @IBOutlet weak var surveyScheduleLbl: UILabel!
    @IBOutlet weak var moveScheduleForLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var orderStatusLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var boderView: UIView!
    @IBOutlet weak var viewDetailsBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        boderView.layer.borderWidth = 0.5
        boderView.layer.borderColor = UIColor.gray.cgColor
        //view details button
        viewDetailsBtn.layer.cornerRadius = 2
        viewDetailsBtn.layer.masksToBounds = true
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setUpData(cell: AllOrderListCustomCell, model: AllOrderListModel){
        
        enquiryOnLbl.text = model.EnquiryDateStr
        enquiryNumberLbl.text = model.UniqueId
        moveNameLbl.text = model.MoveNameStr
        
    }
}
