//
//  ArticleDetailsOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 08/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsOffice: UIViewController{
    
    //MARK: - Properties
    var searchActive : Bool = false
    var cell1: ArticleDetailsTableViewCellOffice? = nil
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var articleCountLbl: UILabel!
    @IBOutlet weak var cftCountLbl: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBarControler: UISearchBar!
    var models = [CategoryListModel]()
    var filtered = [CategoryListModel]()
    var CatId: String = ""
    var CatName: String = ""
    var CountArticle: String = ""
    var CftCount: String = ""
    //MARK: - UIViewController Method
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        searcBar.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 140
        getArticlelist()
    }
    //MARK: - IBOutlet Method
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func viewAllClickedBtn(_ sender: Any) {
        
    }
    @IBAction func submitCLcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Custom Method
    
    func addOrSubArticleItem(list: CategoryListModel, cell: ArticleDetailsTableViewCellOffice){
        WebServices.shared.addItemInArticleListing(methodName: AppConstants.METHOD_ARTICLE_UPDATE, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, itemName: list.name, qty: cell.increaseValueLbl.text!, priceItem: cell.enterAmountTxtField.text!, itemId: list.id, catid: list.catid, addCft: list.addcft, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                    self.models.removeAll()
                    self.searcBar.text = ""
                    self.filtered.removeAll()
                    self.searchActive = false
                    self.CountArticle = response!["count"] as! String
                    self.CftCount = response!["totalcft"] as! String
                    self.articleCountLbl.text = self.CountArticle + " Article"
                    self.cftCountLbl.text = "CFT - " + self.CftCount
                    let listarray:[[String: Any]] = response!["data"] as! [[String : Any]]
                    for list in listarray {
                        self.models.append(CategoryListModel(id: list["id"] as! String, catid: list["catid"] as! String, catImage: list["image"] as! String, lenght:  list["length"] as! String, width: list["width"] as! String, height: list["height"] as! String, name: list["name"] as! String, value: list["value"] as! String, quantity: list["quantity"] as! String, cft: list["cft"] as! String, addcft: list["addcft"] as! String))
                    }
                    self.tableview.reloadData()
                    break
                default:
                    break
                }
            }
        })
    }
    func getArticlelist(){
        WebServices.shared.getArticleListing(methodName: AppConstants.METHOD_ARTICLE_LISTING, uniqid:  AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, catid: CatId,completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                    self.models.removeAll()
                    self.filtered.removeAll()
                    self.searcBar.text = ""
                    self.searchActive = false
                    self.CountArticle = response!["count"] as! String
                    self.CftCount = response!["totalcft"] as! String
                    self.articleCountLbl.text = self.CountArticle + " Article"
                    self.cftCountLbl.text = "CFT - " + self.CftCount
                    let listarray:[[String: Any]] = response!["data"] as! [[String : Any]]
                    for list in listarray {
                        self.models.append(CategoryListModel(id: list["id"] as! String, catid: list["catid"] as! String, catImage: list["image"] as! String, lenght:  list["length"] as! String, width: list["width"] as! String, height: list["height"] as! String, name: list["name"] as! String, value: list["value"] as! String, quantity: list["quantity"] as! String, cft: list["cft"] as! String, addcft: list["addcft"] as! String))
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
extension ArticleDetailsOffice: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        else{
            return models.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell1 = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName, for: indexPath) as? ArticleDetailsTableViewCellOffice
        let model: CategoryListModel
        // if searchControler.
        if searchActive {
            model = filtered[indexPath.row]
        }else{
            model = models[indexPath.row]
        }
        cell1?.enterAmountTxtField.tag = indexPath.row
        cell1?.enterAmountTxtField.delegate = self
        cell1?.minusBtn.tag = indexPath.row
        cell1?.minusBtn.addTarget(self, action:#selector(minusbuttonPressed(_:)), for:.touchUpInside)
        cell1?.plusBtn.tag = indexPath.row
        cell1?.plusBtn.addTarget(self, action:#selector(plusbuttonPressed(_:)), for:.touchUpInside)
        cell1?.setUpLayout(cell: cell1!, list: model)
        
        return cell1!
    }
    
    @objc func minusbuttonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ArticleDetailsTableViewCellOffice
        if cell?.increaseValueLbl.text?.stringToInt() == 0 {
            cell?.greenBtn.isHidden = true
            cell?.enterAmountTxtField.isHidden = true
            cell?.belowLbl.isHidden = true
        }else{
            let value = (cell?.increaseValueLbl.text?.stringToInt())! - 1
            cell?.increaseValueLbl.text = value.intToString()
            cell?.greenBtn.isHidden = false
            cell?.enterAmountTxtField.isHidden = false
            cell?.belowLbl.isHidden = false
            if cell?.increaseValueLbl.text?.stringToInt() == 0 {
                cell?.greenBtn.isHidden = true
                cell?.enterAmountTxtField.isHidden = true
                cell?.belowLbl.isHidden = true
            }
            let model: CategoryListModel
            // if searchControler.
            if searchActive {
                model = filtered[indexPath.row]
            }else{
                model = models[indexPath.row]
            }
            addOrSubArticleItem(list: model , cell: (cell)!)
        }
    }
    @objc func plusbuttonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ArticleDetailsTableViewCellOffice
        let value = (cell?.increaseValueLbl.text?.stringToInt())! + 1
        cell?.increaseValueLbl.text = value.intToString()
        cell?.greenBtn.isHidden = false
        cell?.enterAmountTxtField.isHidden = false
        
        cell?.enterAmountTxtField.delegate = self
        cell?.belowLbl.isHidden = false
        let model: CategoryListModel
        // if searchControler.
        if searchActive {
            model = filtered[indexPath.row]
        }else{
            model = models[indexPath.row]
        }
        addOrSubArticleItem(list: model , cell: (cell)!)
        
    }
    
}

//MARK: - UITableViewDelegate Method
extension ArticleDetailsOffice: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
        
    }
    
}


//MARK: - UISearchBarDelegate Method
extension ArticleDetailsOffice: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = models.filter{ $0.name.lowercased().contains(searcBar.text!.lowercased()) }
        if(filtered.count == 0){
            if searchText == ""{
                searchActive = false
            }else{
                searchActive = true
            }
        } else {
            searchActive = true
        }
        self.tableview.reloadData()
    }
}
//MARK: - UITextFieldDelegate Method
extension ArticleDetailsOffice: UITextFieldDelegate{
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let indexPath = IndexPath(row: textField.tag, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ArticleDetailsTableViewCellOffice
        let model: CategoryListModel
        // if searchControler.
        if searchActive {
            model = filtered[indexPath.row]
        }else{
            model = models[indexPath.row]
        }
        addOrSubArticleItem(list: model , cell: (cell)!)
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
