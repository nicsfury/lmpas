//
//  ArticleCarBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class ArticleCarBike: UIViewController{
    
    
    //MARK: - Properties
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addVehicleBtn: UIButton!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var nameOfVehicleTxtField: UITextField!
    @IBOutlet weak var valueLbl: UITextField!
    var models = [CarItemModel]()
    var randId: String!
    var updateOradd: String!
    //MARK: - UIViewController Method
    override func viewDidAppear(_ animated: Bool) {
        typeLbl.text = "Two Wheeler"
        updateOradd = "1"
        let back =  AppUserDefaults.value(forKey: .BackToVC, fallBackValue: "").string!
        if back == "1" {
            let type =  AppUserDefaults.value(forKey: .BackToVCType, fallBackValue: "").string!
            let name =  AppUserDefaults.value(forKey: .BackToVCName, fallBackValue: "").string!
            let value =  AppUserDefaults.value(forKey: .BackToVCValue, fallBackValue: "").string!
            let randid =  AppUserDefaults.value(forKey: .BackToVCRandid, fallBackValue: "").string!
            randId = randid
            typeLbl.text = type
            nameOfVehicleTxtField.text = name
            valueLbl.text = value
            updateOradd = "2"
            self.addVehicleBtn.setTitle("Update Item", for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
       
    }
    //MARK: - Custom Method
    func updateItem(){
        WebServices.shared.updateItemCarAndBike(methodName: AppConstants.METHOD_UPADTE_ITEM_CAR_AND_BIKE, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, carbyketype: self.typeLbl.text!, cartbykedetails: self.nameOfVehicleTxtField.text!, cartbykevalue: self.valueLbl.text!, randid: randId, completion: {(response,error) in
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
    func addItem(){
        WebServices.shared.addItemCarAndBike(methodName: AppConstants.METHOD_ADD_ITEM_CAR_AND_BIKE, Uniq: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, carbyketype: self.typeLbl.text!, cartbykedetails: self.nameOfVehicleTxtField.text!, cartbykevalue: self.valueLbl.text!, completion: {(response,error) in
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
    //MARK: - IBOutlet Method
    @IBAction func backClikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func submitArticle(_ sender: Any) {
        if self.models.count == 0 {
            showToast(message: "Add items first")
        }else{
            let FinalVC = FinalReviewCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
            self.navigationController?.pushViewController(FinalVC, animated: true)
        }
        
    }
    @IBAction func addClickedBtn(_ sender: Any) {
        guard nameOfVehicleTxtField.text != "" else { showToast(message: "Enter Name First"); return }
        guard valueLbl.text != "" else { showToast(message: "Enter Value First"); return }
      
        if updateOradd == "1"{
             addItem()
            
            
        }else{
            updateItem()
            self.addVehicleBtn.setTitle("Add Item", for: UIControlState.normal)
            updateOradd = "1"
        }
        self.typeLbl.text = "Two Wheeler"
        self.nameOfVehicleTxtField.text = ""
        self.valueLbl.text = ""
    }
    @IBAction func selectTypeClickedBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Which Type of Vehicle You have ?", message: "", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Two Wheeler", style: .default) { (action:UIAlertAction) in
             self.typeLbl.text = "Two Wheeler"
        }
        
        let action2 = UIAlertAction(title: "Four Wheeler", style: .default) { (action:UIAlertAction) in
             self.typeLbl.text = "Four Wheeler"
        }

        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }
    
   
}

//MARK: - UITableViewDataSource Method

extension ArticleCarBike: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemCarAndBikeCustomTableViewCell
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
    func deleteItem(cell: ItemCarAndBikeCustomTableViewCell, item: CarItemModel){
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
        let cell = tableview.cellForRow(at: indexPath)  as? ItemCarAndBikeCustomTableViewCell
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
    
    
    @objc func editButtonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let item: CarItemModel
        item = self.models[indexPath.row]
        randId = item.id
        self.typeLbl.text = item.type
        self.nameOfVehicleTxtField.text = item.name
        self.valueLbl.text = item.value
        self.addVehicleBtn.setTitle("Update Item", for: UIControlState.normal)
        updateOradd = "2"
        
    }
}
//MARK: - UITableViewDelegate Method

extension ArticleCarBike: UITableViewDelegate{
    
}
