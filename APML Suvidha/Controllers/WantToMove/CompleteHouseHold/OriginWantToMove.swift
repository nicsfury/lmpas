//
//  OriginWantToMove.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 21/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class OriginWantToMove: UIViewController{
    
    
    
    var models = [LocationModel]()
    var filteredModels = [LocationModel]()
    var searchActive : Bool = false
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        searcBar.delegate = self
        getCityLocation(name: "origin")
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Custom API Call
    func getCityLocation(name: String){
        
        WebServices.shared.getCityLocation(methodName: name, completion: {(response,error) in
            if error == nil{
                let status = response!["status"] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    let listarray:[[String: Any]] = response!["city"] as! [[String : Any]]
                    for item in listarray{
                        self.models.append(LocationModel(name:(item["name"] as! String)))
                    }
                    self.tableview.reloadData()
                    
                case AppConstants.FAILED:
                    self.showToast(message: "Data not present")
                    
                default:
                    break
                }
            }
        })
    }
}

extension OriginWantToMove: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: LocationModel
        if searchActive{
            model = filteredModels[indexPath.row]
        }
        else {
            model = models[indexPath.row]
        }
         AppUserDefaults.save(value: model.name, forKey: .Location_Origin)
        self.navigationController?.popViewController(animated: true)
    }
}

extension OriginWantToMove: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName, for: indexPath)
        
        let model: LocationModel
        if searchActive {
            model = filteredModels[indexPath.row]
        } else {
            model = models[indexPath.row]
        }
        cell.textLabel!.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filteredModels.count
        }
        else{
            return models.count
        }
    }
    
}

extension OriginWantToMove: UISearchBarDelegate{
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
        filteredModels = models.filter{ $0.name.lowercased().contains(searcBar.text!.lowercased()) }
        
        if(filteredModels.count == 0){
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
