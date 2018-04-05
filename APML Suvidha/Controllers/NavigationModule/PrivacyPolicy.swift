//
//  PrivacyPolicy.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 15/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class PrivacyPolicy: UIViewController{
    //MARK: - Properties
    @IBOutlet weak var webview: UIWebView!
    
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
        setupWebview()
    }
    override func viewDidLoad() {
        
    }
    
    //MARK: - IBOutlet Method
    
    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Custom Method
    func setupWebview(){
        WebServices.shared.getPrivacyPolicy(methodName: AppConstants.METHOD_PRIVACY_POLICY, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! String
                switch(status){
                case AppConstants.SUCCESS:
                     let content = response!["content"] as! String
                     self.webview.loadHTMLString("<html><head></head> <body><p>" + content + " </p></body></html>", baseURL: nil)
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })

    }
}
