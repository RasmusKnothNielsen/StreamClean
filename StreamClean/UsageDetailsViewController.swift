//
//  UsageDetailsViewController.swift
//  StreamClean
//
//  Created by Rasmus Knoth Nielsen on 28/06/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit

class UsageDetailsViewController: UIViewController {



    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "See more usage here"
        //print("In usageDetails:\(profileVC.currentUsage.documentUID)")
        //textLabel.text = profileVC.usages[profileVC.rowThatIsBeingEdited].documentUID
    }
}
