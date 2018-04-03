//  HomeViewController.swift
//  APML Suvidha
//  Created by Nishant Gupta on 20/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var menuItem: UIBarButtonItem!
    @IBOutlet weak var originLbl: UITextField!
    @IBOutlet weak var destinationLbl: UITextField!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    
    
    //MARK: - UIViewController Methode
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        let OriginName = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string
        let DestinationName = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string
        let EnquiryNumber = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string
        statusBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        originLbl.text = OriginName
        destinationLbl.text = DestinationName
        enquiryNumberLbl.text = EnquiryNumber
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItem.target = self.revealViewController()
        menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 240
    }
    //MARK: Custom Method
    func setStepOne(firstMove: String){
        WebServices.shared.stepOneClick(methodName: AppConstants.METHOD_STEP_ONE, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, origin: AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!, destination: AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!, firstMove: firstMove, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    switch firstMove.stringToInt()!{
                        case 1:
                            AppUserDefaults.removeMoveValue()
                            AppUserDefaults.save(value: AppConstants.CompleteHouseHoldType, forKey: .MOVE)
                            let moveDateCVC = MoveDateComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
                            self.navigationController?.pushViewController(moveDateCVC, animated: true)
                        case 2:
                            AppUserDefaults.save(value: AppConstants.OfficeType, forKey: .MOVE)
                            let moveDateOVC = MoveDateOffice.instantiate(fromAppStoryboard: .OfficeStoryboardMain)
                            self.navigationController?.pushViewController(moveDateOVC, animated: true)
                        case 4:
                            AppUserDefaults.save(value: AppConstants.FewItemsType, forKey: .MOVE)
                            let moveDateOVC = AddressFieldFewItem.instantiate(fromAppStoryboard: .FewItemStoryBoardMain)
                            self.navigationController?.pushViewController(moveDateOVC, animated: true)
                        case 5:
                            AppUserDefaults.save(value: AppConstants.CarAndBikeType, forKey: .MOVE)
                            let moveDateOVC = AddressFieldCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
                            self.navigationController?.pushViewController(moveDateOVC, animated: true)
                        default:
                            break
                        }
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                default:
                    break
                }
            }
        })
    }
    //MARK: IBOutlet Method
    @IBAction func originClickedBtn(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            let OriginVC = OriginWantToMove.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(OriginVC, animated: true)
        case 2:
            let DestinationVC = DestinationWantToMove.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(DestinationVC, animated: true)
        default:
            break
        }
       
    }
    @IBAction func wantToMoveClickedBtn(_ sender: Any){
        switch (sender as AnyObject).tag {
        case 1:
            AppUserDefaults.removeMoveValue()
            setStepOne(firstMove: AppConstants.CompleteHouseHoldType)
        case 2:
            AppUserDefaults.save(value: AppConstants.OfficeType, forKey: .MOVE)
            setStepOne(firstMove: AppConstants.OfficeType)
        case 4:
            AppUserDefaults.save(value: AppConstants.FewItemsType, forKey: .MOVE)
             setStepOne(firstMove: AppConstants.FewItemsType)
        case 3:
            AppUserDefaults.save(value: AppConstants.CarAndBikeType, forKey: .MOVE)
             setStepOne(firstMove: AppConstants.CarAndBikeType)
        default:
            break
        }
    }
}

