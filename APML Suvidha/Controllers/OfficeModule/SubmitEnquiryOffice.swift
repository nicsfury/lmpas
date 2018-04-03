//
//  SubmitEnquiryOffice.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 02/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class SubmitEnquiryOffice: UIViewController{
    //MARK: - Properties
    @IBOutlet weak var surveyIdLbl: UILabel!
    @IBOutlet weak var enquiryNumberLb: UILabel!
    
    @IBOutlet weak var surveyIdView: UIView!
    //MARK: - UIViewController Method
    override func viewDidAppear(_ animated: Bool) {
        surveyIdView.isHidden = true
    }
    
    //MARK: - IBOutlet Method
    @IBAction func myAccountClcikedBtn(_ sender: Any) {
        surveyIdView.isHidden = false
    }
    
    
    
    
}
