//
//  MusicViewController.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var helperTextView: UITextView!
    
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
        
        helperTextView.text = "Choose your service(s) and add time spent in the last week."
        
    }
    

    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let usage = vc.validateUserInput(picker: musicServicePicker, pickerData: pickerData, hours: hoursField, result: resultField, minutes: minutesField)
        
        calculator.addMusic(usage: usage)
        
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
    
    
}
