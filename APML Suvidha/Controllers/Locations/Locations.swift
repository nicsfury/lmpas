//
//  Locations.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 26/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class Locations:  UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    var models = [LocationModel]()
    var filteredModels = [LocationModel]()
    var searchActive : Bool = false
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBarControler: UISearchBar!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.delegate = self
        tableview.dataSource = self
        searcBar.delegate = self
         getCityLocation(name: text!)
        setupSearchController()
       
       
        
    }
    
    @IBAction func backClickedBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
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

    
    //MARK: UITABLEVIEW Delegate/Datasource
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
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: LocationModel
        if searchActive{
            model = filteredModels[indexPath.row]
        }
        else {
            model = models[indexPath.row]
        }
        
        if text == "origin"{
            AppUserDefaults.save(value: model.name, forKey: .Location_Origin)
           
        }
        else{
            AppUserDefaults.save(value: model.name, forKey: .Location_Destination)
            
        }
         self.navigationController?.popViewController(animated: true)
    }
    
  
    //MARK: Custom Method
    
    func getCityLocation(name: String){
        
        WebServices.shared.getCityLocation(methodName: name, completion: {(response,error) in
            if error == nil{
                let status = response!["status"] as! Int
                switch(status){
                case 200:
                    let listarray:[[String: Any]] = response!["city"] as! [[String : Any]]
                    for item in listarray{
                        self.models.append(LocationModel(name:(item["name"] as! String)))
                        self.filteredModels.append(LocationModel(name:(item["name"] as! String)))
                    }
                    self.tableview.reloadData()
                    break
                    
                default:
                    break
                }
            }
        })
    }
    func setupSearchController() {
        
    }
    
 
    
    
}




