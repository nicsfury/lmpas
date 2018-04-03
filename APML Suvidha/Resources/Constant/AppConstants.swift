//
//  AppConstants.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation

class AppConstants {

    //API - Base Service Url
    static let kBASE_SERVICE_URL = "https://www.survey.agarwalpackers.com/api/api.php"

    
    //Method - Name
    static let  METHOD_GET_EXPLORE = "getBanner"
    static let METHOD_ORIGIN = "origin"
    static let METHOD_DESTINATION = "destination"
    static let METHOD_SIGNUP = "registerUser"
    static let METHOD_LOGIN = "loginUser"
    static let METHOD_ORDER_LIST = "orderlists"
    static let METHOD_CURRENT_EXPECTED_MOVEDATE = "currentmovedate"
    static let METHOD_AREA_LOCATION = "getCityArea"
    static let METHOD_GET_SLOT = "slots"
    static let METHOD_STEP2 = "step2"
    static let METHOD_ARTICLE_LIST = "articleDetails"
    static let METHOD_STEP_ONE = "step1"
    static let METHOD_ARTICLE_LISTING = "articleItemListing"
    static let METHOD_ARTICLE_UPDATE = "steppp3add"
    static let METHOD_FINAL_REVIEW = "FinalReview"
    static let METHOD_DELETE_ITEM = "deleteManualItem"
    
    
    //UserDefault Var
    static let Location_Origin = "origin"
    static let Location_Destination = "destination"
    
    
    //API-Response Txt
    static let SUCCESS = "200"
    static let FAILED = "500"
    static let DATATXT = "data"
    static let STATUSTXT = "status"
    static let MESSAGETXT = "message"
    
    
    //VC NAME
    static let LoginVC = "LoginSignup"
    
    //Help And Support
    static let HelpAndSupportPhoneNumber = "9717982208"
    static let HelpAndSupportPhoneEmail = "nishant.ibees@gmail.com"
    
    //Move Type
    static let CompleteHouseHoldType = "1"
    static let OfficeType = "2"
    static let CarAndBikeType = "5"
    static let FewItemsType = "4"
    
    
    //Demo Text
    static let DNP = "Data not present"
    static let SDF = "Select Data First"
    static let CellName = "cell"
    static let YesStr = "Yes"
    static let NoStr = "No"
    static let ZeroStr = "0"
    static let OneStr = "1"
  
    
    
    
  static  let menuItem = ["Order History","Profile","Transaction History","Track Shipment","Customer Support","Refer and Earn","FAQs","Offer and Discount","Feedback","About Us","Services","T&C"]
    
  static  let menusubItem = ["View your full order history","Go to your Profile","See full transaction history","Check the current status","Get instant help","Join our referral program","Faq's","Get latest offers and discount","Submit your feedback","Know who we are","Find what all we offer","Term & Condition"]
}
