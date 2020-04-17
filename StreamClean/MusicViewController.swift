//
//  MusicViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var musicServicePicker: UIPickerView!
    
    @IBOutlet weak var hoursField: UITextField!
    
    @IBOutlet weak var minutesField: UITextField!
    
    @IBOutlet weak var resultField: UITextView!
    
    var pickerData: [String] = [String]()
    
    var vc = ViewController()
    
    var calculator = Calculator.calculator
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect the data
        self.musicServicePicker.delegate = self
        self.musicServicePicker.dataSource = self
        
        pickerData = ["Spotify", "Tidal", "Apple Music", "Youtube Music"]
        
    }
    

    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let usage = vc.validateUserInput(picker: musicServicePicker, pickerData: pickerData, hours: hoursField, result: resultField, minutes: minutesField)
        calculator.addMusic(usage: usage)
        
        /*
        if (hoursField!.text == "" && minutesField.text == "") {
            print("user did not input anything")
        }
        else {
            // Check if the user did not write any hours
            if(hoursField.text == "") {
                resultField.text = resultField.text + "✓ \(pickerData[musicServicePicker.selectedRow(inComponent: 0)]) chosen for \(minutesField.text!) minutes!\n"
            }
            // Check if the user did not write any minutes
            else if (minutesField.text == "") {
                resultField.text = resultField.text + "✓ \(pickerData[musicServicePicker.selectedRow(inComponent: 0)]) chosen for \(hoursField.text!) hours!\n"
            }
            // Else add the following to the resultField for the user to see
            else {
                resultField.text = resultField.text + "✓ \(pickerData[musicServicePicker.selectedRow(inComponent: 0)]) chosen for \(hoursField.text!) hours and \(minutesField.text!) minutes!\n"
            }
            
            // Convert user input to integers, and sum up minutes before adding it to calculator.
            let hours = (Int(hoursField.text!) ?? 0) * 60   // Using minutes
            let minutes = Int(minutesField.text!) ?? 0
            calculator.addMusic(usage: hours + minutes)
            
            // Reset fields so they are ready for more input
            hoursField.text = ""
            minutesField.text = ""
        }
 */
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
