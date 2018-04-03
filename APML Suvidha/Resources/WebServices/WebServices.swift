//
//  File.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SVProgressHUD

class WebServices: NSObject {
    
    
    static var shared = WebServices()
    let urlBase = "https://www.survey.agarwalpackers.com/api/api.php"
    private override init() {
        
    }
    //MARK: API - Delete Article FinalReview App
    
    func deleteItemFinalReview(methodName: String ,uniqid: String,itemId: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\",\"id\":\"%@\"}",methodName,uniqid,itemId)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    //MARK: API - Final Review App
    
    func getFinalReview(methodName: String ,uniqid: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\"}",methodName,uniqid)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    //MARK: API - Article Details Listing Add Item
    
    func addItemInArticleListing(methodName: String ,uniqid: String,itemName: String,qty: String,priceItem: String,itemId: String,catid: String,addCft: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\",\"selecteditemsname\":\"%@\",\"selecteditemstools\":\"%@\",\"selecteditemsvalue\":\"%@\",\"itemid\":\"%@\",\"itemcategoryid\":\"%@\",\"cft\":\"%@\"}",methodName,uniqid,itemName,qty,priceItem,itemId,catid,addCft)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    //MARK: API - Article Listing
    
    func getArticleListing(methodName: String ,uniqid: String,catid: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\",\"catid\":\"%@\"}",methodName,uniqid,catid)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    //MARK: API - Step One
    
    func stepOneClick(methodName: String ,uniqid: String,origin: String,destination: String,firstMove: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\",\"firstmove\":\"%@\",\"origin\":\"%@\",\"destination\":\"%@\"}",methodName,uniqid,firstMove,origin,destination)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    //MARK: API - GetArticle List CompleteHouseHold
    
    func getArticleList(methodName: String ,uniqid: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\"}",methodName,uniqid)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    //MARK: API - TimeSlot
    
    func getTimeStot(methodName: String ,surveydate: String,city: String,firstmove: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"surveydate\":\"%@\",\"city\":\"%@\",\"firstmove\":\"%@\"}",methodName,surveydate,city,firstmove)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    
    //MARK: API - SetCompleteAddressOnStepTwo
    
    func setCompleteAddressStep2(methodName: String ,originArea: String,originAddress: String,petValue: String,plantValue: String,email: String,originFloor: String,originLift: String,destinationArea: String,destinationAddress: String,destinationFloor: String,destinationLift: String,surveyDate: String,selfSurvey: String,expectedMoveDate: String,surveyTimeSlot: String,uniqueId: String,name: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"originarea\":\"%@\",\"originaddress\":\"%@\",\"pet\":\"%@\",\"plant\":\"%@\",\"email\":\"%@\",\"originfloor\":\"%@\",\"originlift\":\"%@\",\"destinationarea\":\"%@\",\"destinationaddress\":\"%@\",\"destinationfloor\":\"%@\",\"destinationlift\":\"%@\",\"surveydate\":\"%@\",\"selfsurvey\":\"%@\",\"expectedmovedate\":\"%@\",\"surveytimeslot\":\"%@\",\"uniqid\":\"%@\",\"name\":\"%@\"}",methodName,originArea,originAddress,petValue,plantValue,email,originFloor,originLift,destinationArea,destinationAddress,destinationFloor,destinationLift,surveyDate,selfSurvey,expectedMoveDate,surveyTimeSlot,uniqueId,name)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
    
    
    //MARK: API - GetAreaLocation
    
    func getAreaLocation(methodName: String ,originName: String, completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramsitem = String(format:"{\"method\":\"%@\",\"origin\":\"%@\"}",methodName,originName)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil, nil)
                    SVProgressHUD.dismiss()
                }
                
                break
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
        })
    }
     //MARK: API - CompleteHouseHold
    func setExpectedMoveDate(methodName: String,uniqid: String ,step: String,expectedmovedate: String,completion: @escaping (_ success: [String : Any]?, _ error:Error? ) -> Void){
        
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        let paramsitem = String(format:"{\"method\":\"%@\",\"uniqid\":\"%@\",\"step\":\"%@\",\"expectedmovedate\":\"%@\"}",methodName,uniqid,step,expectedmovedate)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: urlBase)
        
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
    
    
    
    //MARK: API - GET OrderListing
    func getOrderList(methodName: String,mobileNo: String ,type: String,completion: @escaping (_ success: [String : Any]?, _ error:Error? ) -> Void){
        
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        let paramsitem = String(format:"{\"method\":\"%@\",\"mobile\":\"%@\",\"type\":\"%@\"}",methodName,mobileNo,type)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: urlBase)
        
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
    
     //MARK: API - GetBanner
    func getStartBannerApi(methodName: String, completion: @escaping (_ success: [String : Any]?, _ error:Error? ) -> Void){
        
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        
        let paramsitem = String(format:"{\"method\":\"%@\"}",methodName)
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
    
    //MARK: API - UploadImage
    func getUploadedImages(urlImage: String , completion: @escaping (_ success: Any , _ error:Error?) -> Void) {
        //let url = URL(string: urlImage)
        
        Alamofire.request(urlImage).responseData{ (response ) in
            if response.error == nil {
                              print(response.result)
                              if let data = response.data {
                                completion(data, nil)
                                   }
                           }
            
            
        }
        
    }
    
    //MARK: API - Login
    func loginApi(methodName: String , MobileNumber: String , DeviceId: String , completion: @escaping (_ success: [String: Any]? , _ error:Error?) -> Void) {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        let paramsitem = String(format:"{\"method\":\"%@\",\"devicetoken\":\"%@\",\"mobile\":\"%@\"}",methodName,MobileNumber)
        let parameters:[String: String] = ["json_data": paramsitem]
        let url = URL(string: AppConstants.kBASE_SERVICE_URL)
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:{ response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String: Any]{
                    completion(data, nil)
                    SVProgressHUD.dismiss()
                }
                else{
                    completion(nil,nil)
                    SVProgressHUD.dismiss()
                }
                break
                
            case .failure(_):
                let err = response.result.error
                completion(nil, err)
                SVProgressHUD.dismiss()
                break
            }
            
        })
        
        
    }
    
    
    //MARK: API - GetCityLocation
    
    func getCityLocation(methodName: String , completion: @escaping (_ success:[String: Any]? ,_ error:Error?) -> Void) {
    SVProgressHUD.show(withStatus: "Loading...")
    SVProgressHUD.setDefaultMaskType(.clear)
    
    let paramsitem = String(format:"{\"method\":\"%@\"}",methodName)
    let parameters:[String: String] = ["json_data": paramsitem]
    let url = URL(string: AppConstants.kBASE_SERVICE_URL)
    
       Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
        switch(response.result){
        case .success(_):
            if let data = response.result.value as? [String: Any]{
                completion(data, nil)
                SVProgressHUD.dismiss()
            }
            else{
                completion(nil, nil)
                SVProgressHUD.dismiss()
            }
        
            break
        case .failure(_):
            let err = response.result.error
            completion(nil, err)
            SVProgressHUD.dismiss()
            break
        }
       })
}
    
    func getSignUpApi(methodName: String ,deviceToken: String,mobileNumber: String ,userName: String,userEmail: String,originLocation: String, destinationLocstion: String,newEnquiry: String, completion: @escaping (_ success:[String: Any]? , _ error:Error?) -> Void){
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.clear)
        
        let paramitem = String(format:"{\"method\":\"%@\",\"devicetoken\":\"%@\",\"mobile\":\"%@\",\"email\":\"%@\",\"name\":\"%@\",\"origin\":\"%@\",\"destination\":\"%@\",\"newenquiry\":\"%@\"}",methodName,deviceToken,mobileNumber,userEmail,userName,originLocation,destinationLocstion,newEnquiry)
        let parameters:[String:String] = ["json_data": paramitem]
        let url = URL(string:AppConstants.kBASE_SERVICE_URL)
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON( completionHandler: { response in
            switch(response.result){
            case .success(_):
                if let data = response.result.value as? [String : Any]{
                    completion(data,nil)
                    SVProgressHUD.dismiss()
                }else{
                    completion(nil,nil)
                    SVProgressHUD.dismiss()
                }
                break
            case .failure(_):
                let err = response.result.error
                completion(nil,err)
                SVProgressHUD.dismiss()
                break
                
            }
        })
    }

}
