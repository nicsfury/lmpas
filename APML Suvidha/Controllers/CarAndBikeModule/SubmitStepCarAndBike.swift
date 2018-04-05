//
//  SubmitStepCarAndBike.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class SubmitStepCarAndBike: UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    
    @IBOutlet weak var pickUpAddressLbl: UILabel!
    @IBOutlet weak var destinationAddressLbl: UILabel!
    
    @IBOutlet weak var pickUpDateLbl: UILabel!
    var dateStr: String!
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
       setUpLayout()
    }
    //MARK: - Custom Method
    func setUpLayout(){
        enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
        originLbl.text = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "").string!
        destinationLbl.text = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").string!
        pickUpAddressLbl.text = AppUserDefaults.value(forKey: .AreaOriginLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressPickUpLocation, fallBackValue: "").string!
        destinationAddressLbl.text = AppUserDefaults.value(forKey: .AreaDestinationLocation, fallBackValue: "").string! + ", " + AppUserDefaults.value(forKey: .AddressDestinationLocation, fallBackValue: "").string!
        pickUpDateLbl.text = dateStr
        
    }
    //MARK: - IBOutlet Method
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveClikedBtn(_ sender: Any) {
        let itemCar = ArticleCarBike.instantiate(fromAppStoryboard: .CarAndBikeStoryboardMain)
        self.navigationController?.pushViewController(itemCar, animated: true)
    }
}
