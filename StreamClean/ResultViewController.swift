//
//  ResultViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultView: UITextView!
    
    var calculator = Calculator.calculator
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultView.text = "Your CO2 usage is equivalent to \(calculator.getSum()) km driven in a newer Diesel car.\n\nDemand greener alternatives from your streaming provider."
    }


}
