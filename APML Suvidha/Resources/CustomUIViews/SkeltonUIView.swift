//
//  SkeltonUIView.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 27/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
import SkeletonView
@IBDesignable class SkeltonUIView: UIView{
    @IBInspectable var isSkeletonView:Bool = true {
        didSet {
            limitCharacters()
        }
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        limitCharacters()
    }
    
    @objc func limitCharacters() {
   self.showAnimatedGradientSkeleton()
    }
}



