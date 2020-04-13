//
//  ViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 09/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var hoursField: UITextField!
    
    @IBOutlet weak var minutesField: UITextField!
    
    @IBOutlet weak var resultField: UITextView!

    var calculator = Calculator.calculator
    
    var pickerData: [String] = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        self.picker.delegate = self
        self.picker.dataSource = self

        
        // Populate the picker
        pickerData = ["Netflix", "HBO", "Amazon Prime", "Hulu", "DR TV", "Other"]
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if (hoursField!.text == "" && minutesField.text == "") {
            print("user did not input anything")
        }
        else {
            // Check if the user did not write any hours
            if(hoursField.text == "") {
                resultField.text = resultField.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(minutesField.text!) minutes!\n"
            }
            // Check if the user did not write any minutes
            else if (minutesField.text == "") {
                resultField.text = resultField.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(hoursField.text!) hours!\n"
            }
            // Else add the following to the resultField for the user to see
            else {
                resultField.text = resultField.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(hoursField.text!) hours and \(minutesField.text!) minutes!\n"
            }
        
            // Convert user input to integers, and sum up minutes before adding it to calculator.
            let hours = (Int(hoursField.text!) ?? 0) * 60   // Using minutes
            let minutes = Int(minutesField.text!) ?? 0
            calculator.addVideo(usage: hours + minutes)
            
            // Reset fields so they are ready for more input
            hoursField.text = ""
            minutesField.text = ""
        }
    }
    
    
        func nextButtonPressed(_ sender: UIBarButtonItem) {
        //performSegue(withIdentifier: ", sender: self)
    }
        
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

}
