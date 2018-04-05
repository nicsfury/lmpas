//
//  FinalArticleReviewPage.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FinalArticleReviewPage: UIViewController{
    
    //MARK: - Properties
    var models = [CarItemModel]()
    var randId: String!
    
    @IBOutlet weak var tableview: UITableView!
    //MARK: - UIViewController Method
    override func viewDidAppear(_ animated: Bool) {
        getlistItem()
    }
    override func viewDidLoad() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    //MARK: - Custom Method
    
    func getlistItem(){
        WebServices.shared.finalReviewCarAndBike(methodName: AppConstants.METHOD_FINAL_REVIEW, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!,   completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    self.models.removeAll()
                    let listarray:[[String: Any]] = response!["list"] as! [[String: Any]]
                    for item in listarray{
                        self.models.append(CarItemModel(id: item["randid"] as! String, type:  item["cartype"] as! String, name:  item["carmodel"] as! String, value:  item["carvalue"] as! String))
                    }
                    self.tableview.reloadData()
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
    }
    //MARK: - IBOutlet Method
    @IBAction func backClikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FinalArticleReviewPage: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemFinalReviewCarAndBikeCell
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action:#selector(deleteButtonPressed(_:)), for:.touchUpInside)
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action:#selector(editButtonPressed(_:)), for:.touchUpInside)
        let item: CarItemModel
        item = self.models[indexPath.row]
        cell.setUpLayout(cell: cell, item: item)
        return cell
    }
    
    //MARK: - Custom Method
    func deleteItem(cell: ItemFinalReviewCarAndBikeCell, item: CarItemModel){
        WebServices.shared.deleteItemCarAndBike(methodName: AppConstants.METHOD_DELETE_ITEM_CAR_AND_BIKE, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, randid: item.id,  completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    self.models.removeAll()
                    let listarray:[[String: Any]] = response!["data"] as! [[String: Any]]
                    for item in listarray{
                        self.models.append(CarItemModel(id: item["randid"] as! String, type:  item["cartype"] as! String, name:  item["carmodel"] as! String, value:  item["carvalue"] as! String))
                    }
                    self.tableview.reloadData()
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
    }
    
    
    @objc func deleteButtonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ItemFinalReviewCarAndBikeCell
        let item: CarItemModel
        item = self.models[indexPath.row]
        let alertController = UIAlertController(title: "Delete", message: "Do you want to delete ?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            self.deleteItem(cell: cell!, item: item)
        }
        
        let action2 = UIAlertAction(title: "No", style: .cancel) { (action:UIAlertAction) in
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func popBack(_ nb: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < nb else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
                return
            }
        }
    }
    @objc func editButtonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let item: CarItemModel
        item = self.models[indexPath.row]
        randId = item.id
        AppUserDefaults.save(value: "1", forKey: .BackToVC)
        AppUserDefaults.save(value: item.type, forKey: .BackToVCType)
        AppUserDefaults.save(value: item.id, forKey: .BackToVCRandid)
        AppUserDefaults.save(value: item.name, forKey: .BackToVCName)
        AppUserDefaults.save(value: item.value, forKey: .BackToVCValue)
        popBack(3)
    }
}

extension FinalArticleReviewPage: UITableViewDelegate{
    
}
