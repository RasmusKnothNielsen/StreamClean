//
//  ProfileViewController.swift
//  StreamClean
//
//  Created by Rasmus Knoth Nielsen on 28/06/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let firebaseCRUD = FirebaseCRUD()
    var auth = Auth.auth()  // Firebase authentication
    
    var currentUser = ""
    var rowThatIsBeingEdited = -1
    var editingRow = false
    
    var usages = [Usage]()
    var currentUsage = Usage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("CurrentUser: \(auth.currentUser?.uid)")
        //usages = firebaseCRUD.readAllDocuments(userUID: auth.currentUser!.uid)
        firebaseCRUD.readAll(userUID: auth.currentUser!.uid, viewController: self)
        usernameLabel.text = auth.currentUser?.email
        
        print("Usages:")
        print(usages)
        // Set these two to self, so the tableview references the app itself
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    
    
    // Function that returns the number of Strings in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return usages.count
    }
    
    // Function that displays the cells in the Table View
    // If there is two Strings in the array, the following function will be called twice.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // De-queue one of the cells from the our ReusableCells, so we can reuse cells
        // in our memory. This provides us with the ability to scroll through alot of
        // cells, without filling out the system memory unnecessary.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        // Assign string from textArray to the cell
        let usage = usages[indexPath.row]
        cell?.textLabel?.text = "\(usage.documentUID)"
        // return the cell, and unwrap it with the !, since it is an Optional
        return cell!
    }
    
    // This enables the transition from tableview to the view controller
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        currentUsage = usages[indexPath.row]
        rowThatIsBeingEdited = indexPath.row
        print("Taking the didDeselectRowAt method")
        performSegue(withIdentifier: "showUsageDetail", sender: self)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? UsageDetailsViewController {
            viewController.textView.text = currentUsage.documentUID
        }
    }
 */
 
    
    // EDIT
    // Function to handle cell pressed, so we can edit it
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Transfer the text from the row to the user input field
        rowThatIsBeingEdited = indexPath.row;
        print("Now we are in ViewController")
        print("IndexPath.row is: \(rowThatIsBeingEdited)")
        print()
        currentUsage = usages[rowThatIsBeingEdited]
        print("currentUsage:\(currentUsage.documentUID)")
        //usageDetailsVC.textView.text = currentUsage.documentUID
        print("Taking the didSelectRowAt method")
        performSegue(withIdentifier: "showUsageDetail", sender: nil)
        // Set editing to true
        editingRow = true;
    }
    
    // DELETE
    // Function to handle the deletion of a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
      if editingStyle == .delete
      {
        firebaseCRUD.deleteDocument(userUID: currentUser, documentUID: usages[indexPath.row].documentUID)
        // Delete the given row from the table view
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    // Function used to get the correct location on the operating system
    func getDocumentDir() -> URL
    {
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentDir[0]
    }

}
