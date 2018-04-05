//
//  AddressFieldCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
class AddressFieldCarAndBike: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      
    }
    override func viewDidAppear(_ animated: Bool) {
        setupLayout()
    }
    //MARK: - Custom Method
    func setupLayout(){
        originLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextClikedBtn(_ sender: Any) {
        let iSPickUp = AppUserDefaults.value(forKey: .IsPickUpSave, fallBackValue: "").string
        if  iSPickUp == AppConstants.YesStr{
            let PickUpDateVC = PickUpDateCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
            self.navigationController?.pushViewController(PickUpDateVC, animated: true)
        }else{
            self.showToast(message: "Fill PickUp Location First")
        }
        
    
    }
    
    @IBAction func addressFieldClikedBtn(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            let PickUpAddressVC = PickUpAddressCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
            self.navigationController?.pushViewController(PickUpAddressVC, animated: true)
            break
        case 2:
            let DestinationAddressVC = DestiantionAddressCarAndBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
            self.navigationController?.pushViewController(DestinationAddressVC, animated: true)
            break
        default:
            break
        }
    }
}
