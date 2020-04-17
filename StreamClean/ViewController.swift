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
        
        let usage = validateUserInput(picker: picker, pickerData: pickerData, hours: hoursField, result: resultField, minutes: minutesField)
        calculator.addVideo(usage: usage)
        
    }
        
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Function used to validate user input through out the app
    public func validateUserInput(picker:UIPickerView, pickerData: [String], hours:UITextField, result:UITextView, minutes:UITextField) -> (Int) {
        
        var hoursInt:Int = 0
        var minutesInt:Int = 0
        
        if (hours.text == "" && minutes.text == "") {
            print("user did not input anything")
        }
        else {
            // Check if the user did not write any hours
            if(hours.text == "") {
                result.text = result.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(minutes.text!) minutes!\n"
            }
                // Check if the user did not write any minutes
            else if (minutes.text == "") {
                result.text = result.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(hours.text!) hours!\n"
            }
                // Else add the following to the resultField for the user to see
            else {
                result.text = result.text + "✓ \(pickerData[picker.selectedRow(inComponent: 0)]) chosen for \(hours.text!) hours and \(minutes.text!) minutes!\n"
            }
            
            // Convert user input to integers, and sum up minutes before adding it to calculator.
            hoursInt = (Int(hours.text!) ?? 0) * 60   // Using minutes
            minutesInt = Int(minutes.text!) ?? 0
            // Reset fields so they are ready for more input
            hours.text = ""
            minutes.text = ""
            
        }
        return hoursInt + minutesInt
    }
    

}
