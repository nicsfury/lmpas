//
//  FaqSubMain.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class FaqSubMain: UIViewController{
    
    //MARK: - Properties
    var searchActive : Bool = false
    var CatValue: String!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    var models = [FaqModel]()
    var filtered = [FaqModel]()
    
    
    //MARK: - UIViewController Method
    override func viewDidLoad() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.estimatedRowHeight = 600
        
        self.tableview.setNeedsLayout()
        self.tableview.layoutIfNeeded()
    }
    override func viewDidAppear(_ animated: Bool) {
        setUpLayout()
    }
    //MARK: - Custom Method
    
    func setUpLayout(){
        WebServices.shared.getFaq(methodName: AppConstants.METHOD_GET_FAQ, categoryName: CatValue, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                switch(status){
                case 200:
                    let listarray:[[String: Any]] = response!["faq"] as! [[String : Any]]
                    for list in listarray {
                        self.models.append(FaqModel(id: list["id"] as! String, question: list["question"] as! String, answer: list["answer"] as! String))
                    }
                    self.tableview.reloadData()
                default:
                    break
                }
            }
        })
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate Method
extension FaqSubMain: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var model: FaqModel
        // if searchControler.
        if searchActive {
            model = filtered[indexPath.row]
        }else{
            model = models[indexPath.row]
        }
        let faqAns = FaqAnswer.instantiate(fromAppStoryboard: .FaqsMain)
        faqAns.answerStr = model.answer
        self.navigationController?.pushViewController(faqAns, animated: true)
    }
}

//MARK: - UITableViewDataSource Method
extension FaqSubMain: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        else{
            return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! faqCustomCell
        var model: FaqModel
        // if searchControler.
        if searchActive {
            model = filtered[indexPath.row]
        }else{
            model = models[indexPath.row]
        }
        cell.questionLbl.text = "Q. " + model.question
        return cell
    }
    
    
}

//MARK: - UISearchBarDelegate Method
extension FaqSubMain: UISearchBarDelegate{
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
        filtered = models.filter{ $0.question.lowercased().contains(searchbar.text!.lowercased()) }
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
