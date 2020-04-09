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
        print("Add button pressed")
        print(pickerData[picker.selectedRow(inComponent: 0)])
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

