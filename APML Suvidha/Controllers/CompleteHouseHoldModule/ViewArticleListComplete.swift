//
//  ViewArticleListComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 27/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
class ViewArticleListComplete: UIViewController{
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
  
    func deleteArticleItem(listArticle: ViewArticleFinalReview, cell: ViewArticleListCompleteTableViewCell){
        WebServices.shared.deleteItemFinalReview(methodName: AppConstants.METHOD_DELETE_ITEM, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, itemId:listArticle.id ,completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                     self.models.removeAll()
                    let listarray:[[String: Any]] = response!["list"] as! [[String : Any]]
                    for list in listarray {
                        let catid = list["category_status"] as! String
                        switch catid {
                        case "":
                            break
                        case "0":
                            self.models.append(ViewArticleFinalReview(id: (list["id"] as? String)!, itemName: (list["item_name"] as? String)!, itemQuantity: (list["item_quantity"] as? String)!, itemValue: (list["item_value"] as? String)!, itemCatId: (list["item_category_id"] as? String)!, catName: (list["category_name"] as? String)!, fileName: (list["file_name"] as? String)!, catStatus: (list["category_status"] as? String)!, catId: AppConstants.ZeroStr, itemId: AppConstants.ZeroStr))
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
 //MARK: - UITableViewDelegate Method
extension ViewArticleListComplete: UITableViewDelegate{
    
}
 //MARK: - UITableViewDataSource Method
extension ViewArticleListComplete: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var model: ViewArticleFinalReview
        model = self.models[indexPath.row]
        if model.catStatus == "1"{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellfirst") as! ViewArticleFirstCell
            cell1.setUpLayout(list: model, cell: cell1)
            cell = cell1
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewArticleListCompleteTableViewCell
            cell2.deleteBtn.tag = indexPath.row
            cell2.deleteBtn.addTarget(self, action:#selector(deletebuttonPressed(_:)), for:.touchUpInside)
            cell2.setUpLayout(list: model, cell: cell2)
            cell = cell2
        }
        return cell
    }
    
     //MARK: - Selector Method
    @objc func deletebuttonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ViewArticleListCompleteTableViewCell
        let model: ViewArticleFinalReview
        model = models[indexPath.row]
        deleteArticleItem(listArticle: model , cell: (cell)!)
        
    }
    
}
