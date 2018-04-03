//
//  MyCollectionViewCell.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class MyCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var articleNameLbl: UILabel!
    @IBOutlet weak var countBtn: UIButton!
    
    @IBOutlet weak var articleImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpLayOut(listModel: ArticleListModel, cell: MyCollectionViewCell)  {
     
        cell.articleNameLbl.text = listModel.articleName
        cell.countBtn.layer.cornerRadius = cell.countBtn.frame.width/2
        let urlString = listModel.articleImg.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

        if listModel.articleCount == AppConstants.ZeroStr {
            cell.countBtn.isHidden = true
        }else{
            cell.countBtn.isHidden = false
            cell.countBtn.setTitle(listModel.articleCount, for: UIControlState.normal)
        }
        let url = URL(string: urlString!)
        let placeholderImage = UIImage(named: "Icon")!
        cell.articleImg.af_setImage(withURL: url!, placeholderImage: placeholderImage)
    }
}
