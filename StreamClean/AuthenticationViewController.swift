//
//  AuthenticationViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 17/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookCore
import FacebookLogin

class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var firebaseManager:FirebaseManager?
    var facebookManager:FacebookManager?
    
    var auth = Auth.auth()  // Firebase authentication
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseManager = FirebaseManager(parentVC: self)   // Enable firebaseManager to update GUI
        facebookManager = FacebookManager(parentVC: self);  // Enable Facebook to update GUI
    }
    

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        // Verify that user has typed email and password
        if let email = emailField.text, let password = passwordField.text {
            if firebaseManager!.validateEmail(candidate: email) && firebaseManager!.validatePassword(password: password){
                // If email and password is present, try to sign in.
                firebaseManager!.signIn(email: emailField.text!, password: passwordField.text!)
            }
        }
    }
    
    @IBAction func signInFacebookButtonPressed(_ sender: UIButton) {
        facebookManager?.loginToFacebook()
    }
    
    @IBAction func newUserButtonPressed(_ sender: UIButton) {
        // Verify that user has typed an email and password
        if let email = emailField.text, let password = passwordField.text {
            if firebaseManager!.validateEmail(candidate: email) && firebaseManager!.validatePassword(password: password){
                // If email and password is present, try to sign up.
                firebaseManager!.signUp(email: email, password: password)
                
                // TODO Tell the user that the sign up was successful
            }
        }
    }
    
    
    

}
