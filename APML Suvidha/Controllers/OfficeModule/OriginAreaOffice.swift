//
//  OriginAreaOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class OriginAreaOffice: UIViewController{
    //MARK: - Properties
    var models = [String]()
    var filteredModels = [String]()
    var searchActive : Bool = false
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    //MARK: - UIViewController
    override func viewDidLoad() {
        searcBar.delegate = self
        let cityOrigin = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string
        getCityLocation(name: cityOrigin!)
    }
    //MARK: - IBOutlet Method
    @IBAction func backClikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Custom API Call
    func getCityLocation(name: String){
        
        WebServices.shared.getAreaLocation(methodName: AppConstants.METHOD_AREA_LOCATION,originName: name, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    let listarray:[String] = response!["datacity"] as! [String]
                    for item in listarray{
                        self.models.append(item)
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
}


//MARK: - UITableViewDelegate Method
extension OriginAreaOffice: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: String
        if searchActive{
            model = filteredModels[indexPath.row]
        }
        else {
            model = models[indexPath.row]
        }
        AppUserDefaults.save(value: model, forKey: .AreaOriginLocation)
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDataSource Method
extension OriginAreaOffice: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName, for: indexPath)
        
        let model: String
        if searchActive {
            model = filteredModels[indexPath.row]
        } else {
            model = models[indexPath.row]
        }
        cell.textLabel!.text = model
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
//MARK: - UISearchBarDelegate Method
extension OriginAreaOffice: UISearchBarDelegate{
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
        filteredModels = models.filter{ $0.lowercased().contains(searcBar.text!.lowercased()) }
        
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
