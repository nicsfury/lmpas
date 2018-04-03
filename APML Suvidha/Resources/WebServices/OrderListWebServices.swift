//
//  OrderListWebServices.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 19/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SVProgressHUD

class OrderListWebServices: NSObject {
    
    
    static var shared = OrderListWebServices()
    
    private override init() {
        
    }
    
    //MARK: API - GET OrderListing
    func getOrderList(methodName: String,mobileNo: String ,type: String,completion: @escaping (_ success: [String : Any]?, _ error:Error? ) -> Void){
        
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        let paramsitem = String(format:"{\"method\":\"%@\",\"mobile\":\"%@\",,\"type\":\"%@\"}",methodName,mobileNo,type)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    debugPrint(data)
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }else{
                    completion(nil,nil)
                    SVProgressHUD.dismiss()
                }
                break
                
            case .failure(_):
                let err = response.result.error
                //debugPrint(err?.localizedDescription ?? "Error")
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
                
            }
        })
    }
    

    
}
