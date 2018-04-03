//
//  FinalReviewArticleList.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 30/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FinalReviewArticleList: UIViewController{
    //MARK: - Properties
    var models = [ViewArticleFinalReview]()
    @IBOutlet weak var tableview: UITableView!
    
    
    //MARK: - UIViewController Method
    override func viewDidAppear(_ animated: Bool) {
        getFianlReviewMethod()
    }
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    //MARK: - IBOutlet Method
    
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Custom Method
    
    func getFianlReviewMethod(){
        WebServices.shared.getFinalReview(methodName: AppConstants.METHOD_FINAL_REVIEW, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!,completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                    
                    let listarray:[[String: Any]] = response!["list"] as! [[String : Any]]
                    for list in listarray {
                        let catid = list["category_status"] as! String
                        switch catid {
                        case "":
                            self.models.append(ViewArticleFinalReview(id: AppConstants.ZeroStr, itemName: AppConstants.ZeroStr, itemQuantity: AppConstants.ZeroStr, itemValue: AppConstants.ZeroStr, itemCatId:AppConstants.ZeroStr, catName: AppConstants.ZeroStr, fileName:AppConstants.ZeroStr, catStatus: (list["category_status"] as? String)!, catId: AppConstants.ZeroStr, itemId: AppConstants.ZeroStr))
                            break
                        case "0":
                            self.models.append(ViewArticleFinalReview(id: (list["id"] as? String)!, itemName: (list["item_name"] as? String)!, itemQuantity: (list["item_quantity"] as? String)!, itemValue: (list["item_value"] as? String)!, itemCatId: (list["item_category_id"] as? String)!, catName: (list["category_name"] as? String)!, fileName: (list["file_name"] as? String)!, catStatus: (list["category_status"] as? String)!, catId: (list["catid"] as? String)!, itemId: (list["itemid"] as? String)!))
                        case "1":
                            self.models.append(ViewArticleFinalReview(id: AppConstants.ZeroStr, itemName: (list["item_name"] as? String)!, itemQuantity: AppConstants.ZeroStr, itemValue: AppConstants.ZeroStr, itemCatId:AppConstants.ZeroStr, catName: (list["category_name"] as? String)!, fileName:AppConstants.ZeroStr, catStatus: (list["category_status"] as? String)!, catId: AppConstants.ZeroStr, itemId: AppConstants.ZeroStr))
                        default:
                            break
                        }
                        
                    }
                    self.tableview.reloadData()
                    break
                default:
                    break
                }
            }
        })
    }
}
 //MARK: - UITableViewDataSource Method
extension FinalReviewArticleList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
        var model: ViewArticleFinalReview
        model = self.models[indexPath.row]
        
        switch model.catStatus {
        case "":
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "third") as! ThirdFinalReviewCustomCell
            
            cell = cell3
            break
        case "0":
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "second") as! SecondFinalReviewCustomCell
            
            cell = cell2
        case "1":
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "first") as! FinalReviewArticleCustomCell
            cell = cell1
        default:
            break
        }
        

        return cell
    }
    
    
    
}

//MARK: - UITableViewDelegate Method
extension FinalReviewArticleList: UITableViewDelegate{
    
}
