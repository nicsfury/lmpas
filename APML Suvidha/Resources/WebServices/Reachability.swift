//
//  Reachability.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import Alamofire

public class Reachability {
    
    
    class func isConnectedToInternet() ->Bool {
    return NetworkReachabilityManager()!.isReachable
    }
}

