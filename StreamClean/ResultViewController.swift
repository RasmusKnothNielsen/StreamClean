//
//  ResultViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResultViewController: UIViewController {

    @IBOutlet weak var resultView: UITextView!
    
    var calculator = Calculator.calculator
    
    let firebaseCRUD = FirebaseCRUD()
    
    let auth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultView.text = "Your CO2 usage is equivalent to \(calculator.getSum()) km driven in a newer Diesel car.\n\nDemand greener alternatives from your streaming provider.\n\n For more information, visit @StreamClean"
        
        // Create Usage object from calculator
        let usage = Usage(calculator: calculator)
        // If user is logged in
        let authenticated = self.auth.currentUser?.uid
        if authenticated != nil {
            firebaseCRUD.createDocument(userUID: self.auth.currentUser!.uid, usage: usage)
        }
        // If user is not logged in, save the usage anyway for analyzing purposes
        else {
            firebaseCRUD.createDocument(userUID: "John Doe", usage: usage)
        }
        
        
        
        
    }


}
