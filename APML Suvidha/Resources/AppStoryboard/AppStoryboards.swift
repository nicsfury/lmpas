//
//  AppStoryboards.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 28/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String {
    
    case Main = "Main"
    case CompleteHouseHoldMain = "CompleteHouseholdStoryboard"
    case OfficeStoryboardMain = "OfficeStoryboard"
    case FewItemStoryBoardMain = "FewItemStoryBoard"
    case CarAndBikeStoryboardMain = "CarAndBikeStoryboard"
    case OrderListAndDetailsMain = "OrderListAndDetails"
    case HelpAndSupportMain = "NavigationList"
    case FaqsMain = "Faqs"
    case OrderDetailsMain = "OrderDetails"
    case BillingDetailsMain = "BillingDetails"
    case PaymentDetailsMain = "PaymentDetails"
    case FeedbackMain = "FeedbackStoryboard"
    
    
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
