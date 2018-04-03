//
//  String.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 22/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
extension String {
    func stringToInt() -> Int? {
        if let b = Int(self) {
            return b
        }
        else {
            return 0
        }
    }
   
}
