//
//  FaqAnswer.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 03/04/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit

class FaqAnswer: UIViewController {

    @IBOutlet weak var answerNamelbl: UILabel!
    var answerStr: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        answerNamelbl.numberOfLines = 0
        answerNamelbl.lineBreakMode = .byWordWrapping
        answerNamelbl.sizeToFit()
        answerNamelbl.text = answerStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backClickedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
