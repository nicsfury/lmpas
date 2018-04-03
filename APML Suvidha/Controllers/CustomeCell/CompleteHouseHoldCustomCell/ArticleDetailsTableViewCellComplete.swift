//
//  ArticleDetailsTableViewCellComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 07/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire




class ArticleDetailsTableViewCellComplete: UITableViewCell{
    
    
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var enterAmountTxtField: UITextField!
    @IBOutlet weak var articleNameLbl: UILabel!
    @IBOutlet weak var articleLenghtLbl: UILabel!
    @IBOutlet weak var articleWidthLbl: UILabel!
    @IBOutlet weak var articleHieghtLbl: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var increaseValueLbl: UILabel!
    @IBOutlet weak var belowLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
   
    func setUpLayout(cell: ArticleDetailsTableViewCellComplete, list: CategoryListModel){
        
        cell.articleNameLbl.text =  list.name
        cell.articleLenghtLbl.text = "L: " + list.lenght
        cell.articleWidthLbl.text =  "W: " + list.width
        cell.articleHieghtLbl.text = "H: " + list.height
        cell.increaseValueLbl.text = list.quantity
        if list.quantity == "0"{
            cell.greenBtn.isHidden = true
            cell.belowLbl.isHidden = true
            cell.enterAmountTxtField.isHidden = true
        }else{
            cell.greenBtn.isHidden = false
            cell.belowLbl.isHidden = false
            cell.enterAmountTxtField.isHidden = false
        }
        cell.enterAmountTxtField.text = list.value
        let urlString = list.catImage.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: urlString!)
        let placeholderImage = UIImage(named: "Icon")!
        cell.articleImg.af_setImage(withURL: url!, placeholderImage: placeholderImage)
        
    }
}
