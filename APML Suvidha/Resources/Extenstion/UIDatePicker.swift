//
//  UIDatePicker.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 21/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit
extension UIDatePicker {
    func setExpectedMoveDate() {
        let calendar = Calendar.current
        var minDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        minDateComponent.day = minDateComponent.day! + 3
        
        minDateComponent.month =  minDateComponent.month!
        minDateComponent.year =  minDateComponent.year!
        
        let minDate = calendar.date(from: minDateComponent)
        
        var maxDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        maxDateComponent.day = minDateComponent.day! + 31
        maxDateComponent.month =  minDateComponent.month!
        maxDateComponent.year =  minDateComponent.year!
        
        let maxDate = calendar.date(from: maxDateComponent)
        self.minimumDate = minDate
        self.maximumDate = maxDate
    } }


