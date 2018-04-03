//
//  CustomUITextView.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 26/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

@IBDesignable class CustomUITextField: UITextField{
    @IBInspectable var maximumCharacters:Int = 10 {
        didSet {
            limitCharacters()
        }
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        limitCharacters()
        addTarget(self, action: #selector(CustomUITextField.limitCharacters), for: .editingChanged)
    }
    
    @objc func limitCharacters() {
        guard text != nil else {
            return
        }
        if (text?.count)! > maximumCharacters {
            if let range = text?.index(before: (text?.endIndex)!) {
                text = String(text![range...])
            }
        }
    }
}


