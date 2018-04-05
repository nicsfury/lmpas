//
//  Profile.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class Profile: UIViewController{
    
    //MARK: - Properties
    let datePickerAnni: UIDatePicker = UIDatePicker()
    let datePickerDate: UIDatePicker = UIDatePicker()
    let buttonViewAnni : UIView = UIView()
    let buttonViewDate : UIView = UIView()
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    var profileModels = [ProfileModel]()
    //MARK: - UIViewController Method
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setupLqayout()
    }
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Custom Method
    func setupLqayout(){
        WebServices.shared.getProfile(methodName: AppConstants.METHOD_GET_PROFILE, mobile: AppUserDefaults.value(forKey: .USERMOBILE, fallBackValue: "").string!,completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusStr = String(status)
                switch(statusStr){
                case AppConstants.SUCCESS:
                    let id = response!["id"] as! String
                    let email = response!["email"] as! String
                    let name = response!["name"] as! String
                    let mobile = response!["mobile"] as! String
                    let alternatemobile = response!["optionalmobile"] as! String
                    let dob = response!["dob"] as! String
                    let anni = response!["anniversery"] as! String
                    let img = response!["profileimage"] as! String
                    let address = response!["address"] as! String
                    self.mobileLbl.text = mobile
                    self.nameLbl.text = name
                    self.profileModels.append(ProfileModel(name: name, id: id, email: email, mobile: mobile, alternate: alternatemobile, dob: dob, profileimage: img, anniversery: anni, address: address))
                    self.tableview.reloadData()
                    break
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
        
    }
}
//MARK: - UITableViewDataSource Method
extension Profile: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName) as! ProfileCustomCell
        cell.updateBtn.addTarget(self, action:#selector(updatebuttonPressed(_:)), for:.touchUpInside)
        cell.annivesaryBtn.addTarget(self, action:#selector(anniversorybuttonPressed(_:)), for:.touchUpInside)
        cell.dateOfBirthBtn.addTarget(self, action:#selector(dateofbirthdbuttonPressed(_:)), for:.touchUpInside)
        cell.mobileTxtField.isEnabled = false
        let model: ProfileModel
        model = profileModels[0]
        cell.setCellLayout(cell: cell, model: model)
        return cell
    }
    
    //MARK: - Custom Method
    @objc func updatebuttonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ProfileCustomCell
        guard cell?.nameLbl.text != ""  else { showToast(message: "Enter Name First"); return }
        guard cell?.emailTxtField.text != ""  else  { showToast(message: "Enter Email First"); return }
        
    }
    
    //Anniversory
    @objc func anniversorybuttonPressed(_ sender: AnyObject) {
        anniversoryDate()
    }
    func anniversoryDate(){
        
        datePickerAnni.datePickerMode = UIDatePickerMode.date
        datePickerAnni.frame = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        datePickerAnni.backgroundColor = UIColor.white
        datePickerAnni.addTarget(self, action: #selector(Profile.datePickerValueChangedAnni(_:)), for: .valueChanged)
        let screenSize: CGRect = UIScreen.main.bounds
        buttonViewAnni.frame =  CGRect(x: 0, y: self.view.frame.height-250, width: screenSize.width - 10, height: 50)
        buttonViewAnni.backgroundColor = UIColor.white
        //custom button
        let button = UIButton()
        button.frame = CGRect(x: buttonViewAnni.frame.size.width - 60, y: 0, width: 50, height: 50)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonViewAnni.addSubview(button)
        self.view.addSubview(buttonViewAnni)
        self.view.addSubview(datePickerAnni)
        datePickerAnni.isHidden = false
        buttonViewAnni.isHidden = false
        
    }
    @objc func buttonAction(sender: UIButton!) {
         datePickerAnni.isHidden = true
        buttonViewAnni.isHidden = true
        
    }
    @objc func datePickerValueChangedAnni(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ProfileCustomCell
        let selectedDate: String = dateFormatter.string(from: sender.date)
        cell?.anniversoryLbl.text = selectedDate
        
    }
    //DateOfBirth
    @objc func dateofbirthdbuttonPressed(_ sender: AnyObject) {
        let button = sender as? UIButton
        let tag = button?.tag
        let indexPath = IndexPath(row: tag!, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ProfileCustomCell
        dateofbirthDate(cell: cell!, type: AppConstants.OneStr)
    }
    func dateofbirthDate(cell: ProfileCustomCell, type: String){
        datePickerDate.datePickerMode = UIDatePickerMode.date
        datePickerDate.frame = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        datePickerDate.backgroundColor = UIColor.white
        datePickerDate.addTarget(self, action: #selector(Profile.datePickerValueChanged(_:)), for: .valueChanged)
        let screenSize: CGRect = UIScreen.main.bounds
        buttonViewDate.frame = CGRect(x: 0, y: self.view.frame.height-250, width: screenSize.width - 10, height: 50)
        buttonViewDate.backgroundColor = UIColor.white
        //custom button
        let button = UIButton()
        button.frame = CGRect(x: buttonViewDate.frame.size.width - 60, y: 0, width: 50, height: 50)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
        buttonViewDate.addSubview(button)
        self.view.addSubview(buttonViewDate)
        self.view.addSubview(datePickerDate)
        datePickerDate.isHidden = false
        buttonViewDate.isHidden = false
    }
    @objc func buttonActionDate(sender: UIButton!) {
        datePickerDate.isHidden = true
        buttonViewDate.isHidden = true
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableview.cellForRow(at: indexPath)  as? ProfileCustomCell
        let selectedDate: String = dateFormatter.string(from: sender.date)
        cell?.dateofBirthLbl.text = selectedDate
        
    }
}
//MARK: - UITableViewDelegate Method
extension Profile: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}

//MARK: - UITextFieldDelegate Method
extension Profile: UITextFieldDelegate{
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
