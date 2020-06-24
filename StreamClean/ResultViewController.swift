//
//  ResultViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftGifOrigin

class ResultViewController: UIViewController {

    @IBOutlet weak var resultView: UITextView!
    @IBOutlet weak var comparisonView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var calculator = Calculator.calculator
    
    let firebaseCRUD = FirebaseCRUD()
    
    let auth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultView.text = "Your CO2 usage is equivalent to \(calculator.getSum()) km driven in a newer Diesel car.\n\nDemand greener alternatives from your streaming provider."
        
        imageView.loadGif(name: "drivingcar")
        
        // Create Usage object from calculator
        let usage = Usage(calculator: calculator)
        // If user is logged in
        let authenticated = self.auth.currentUser?.uid
        var userUID = ""
        // Check if the user is logged in, and set userUID accordingly
        if authenticated != nil {
            userUID = self.auth.currentUser!.uid
        }
        // If user is not logged in, save the usage anyway for analyzing purposes
        else {
            userUID = "John Doe"

        }
        // Save the usage to Firebase
        firebaseCRUD.createDocument(userUID: userUID, usage: usage)
        // Get the average of the users usage, and display it
        calculator.getAverageOfDocuments(userUID: userUID, vc: self)
        
        
        
        
    }


}
