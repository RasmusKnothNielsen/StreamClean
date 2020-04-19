//
//  SignUpViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 18/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var helperTextView: UITextView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    
    var firebaseManager:FirebaseManager?
    
    var auth = Auth.auth()  // Firebase authentication
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseManager = FirebaseManager(parentVC: self)   // Enable firebaseManager to update GUI
        
        helperTextView.text = "Please provide username, email and password to create a new user."

        
    }

    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        // Remove the keyboard
        resignFirstResponder()
        
        // Verify that user has typed an email and password
        if let username = userNameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let repeatPassword = repeatPasswordTextField.text{
            
            // Check if the two passwords are the same
            if (password == repeatPassword) {
                
                // Validate input
                if firebaseManager!.validateEmail(candidate: email) && firebaseManager!.validatePassword(password: password){
                    
                    // If email and password is present, try to sign up.
                    let signedUp = firebaseManager!.signUp(username: username, email: email, password: password)
                
                    
                    let userUID = firebaseManager!.auth.currentUser?.uid
                    resultTextView.text = "User successfully created!"
                    print("User created: \n\tUsername: \(username)\n\tEmail: \(email)\n\tUID: \(userUID!)")
                        
                    
                    
                }
                else {
                    resultTextView.text = "Email must be valid and password must be 8 characters or longer"
                }
            }
            // Passwords not identical
            else {
                resultTextView.text = "The two passwords are not identical, please try again."
                
                // Clear password fields
                passwordTextField.text = ""
                repeatPasswordTextField.text = ""
                
                // Set the cursor in the first password field, to make it easier to re-enter password
                passwordTextField.becomeFirstResponder()
            }
        }
    }
}
