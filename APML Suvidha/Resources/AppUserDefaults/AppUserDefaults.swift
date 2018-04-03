//
//  AppUserDefaults.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 28/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import SwiftyJSON
enum AppUserDefaults {
    
    enum Key : String {
        
        case Location_Origin
        case Location_Destination
        case OTP
        case UNIQUE
        case USEREMAIL
        case USERNAME
        case USERMOBILE
        case MOVE
        case ExpectedMoveDateComplete
        case AreaStatus
        
        //removeable After Use
        
        case AreaOriginLocation
        case AddressPickUpLocation
        case PetPickUpLocation
        case PlantPickUpLocation
        case LiftAvialablePickUpLocation
        case FloorCountPickUpLocation
        case IsPickUpSave
        case ScheduleDate
        case ScheduleTime
        
        case AreaDestinationLocation
        case AddressDestinationLocation
        case PetDestinationLocation
        case PlantDestinationLocation
        case LiftAvialableDestinationLocation
        case FloorCountDestinationLocation
        case IsDestinationSave
        
    }
}

extension AppUserDefaults {
    
    static func value(forKey key: Key, file : String = #file, line : Int = #line, function : String = #function) -> JSON {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            fatalError("No Value Found in UserDefaults\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return JSON(value)
    }
    
    static func value<T>(forKey key: Key, fallBackValue : T, file : String = #file, line : Int = #line, function : String = #function) -> JSON {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            print("No Value Found in UserDefaults\nFile : \(file) \nFunction : \(function)")
            return JSON(fallBackValue)
        }
        
        return JSON(value)
    }
    
    static func save(value : Any, forKey key : Key) {
        
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeValue(forKey key : Key) {
        
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    static func removeMoveValue() {
        
        UserDefaults.standard.removeObject(forKey: Key.AreaDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.AddressDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.PetDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.PlantDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.LiftAvialableDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.FloorCountDestinationLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.IsDestinationSave.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.AreaOriginLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.AddressPickUpLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.PetPickUpLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.PlantPickUpLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.LiftAvialablePickUpLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.FloorCountPickUpLocation.rawValue)
        UserDefaults.standard.removeObject(forKey: Key.IsPickUpSave.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeAllValues() {
        
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        
    }
    
}
