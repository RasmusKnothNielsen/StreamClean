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
    @IBOutlet weak var usageTextView: UITextView!
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
        firebaseCRUD.loadUsersDocumentsInTableView(userUID: auth.currentUser!.uid, viewController: self)
        
        usernameLabel.text = auth.currentUser?.email
        
        // Set these two to self, so the tableview references the app itself
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    // Function that returns the number of Strings in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usages.count
    }
    
    // Function that displays the cells in the Table View
    // If there is two Strings in the array, the following function will be called twice.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // De-queue one of the cells from the our ReusableCells, so we can reuse cells
        // in our memory. This provides us with the ability to scroll through alot of
        // cells, without filling out the system memory unnecessary.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        
        // sort the usages by date so that the tableview will show usages in the right order, from newest to oldest
        usages = usages.sorted() { $0.date > $1.date }
        
        // Format the date to be easier to read.
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let formattedDate = dateFormatter.string(from: usages[indexPath.row].date)
        
        cell?.textLabel?.text = formattedDate
        // return the cell, and unwrap it with the !, since it is an Optional
        return cell!
    }
 
    
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
        populateUsageTextView(usage: currentUsage)
        // Set editing to true
        editingRow = true;
    }
 
    
    // DELETE
    // Function to handle the deletion of a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
      if editingStyle == .delete
      {
        print("Trying to delete")
        print(usages[indexPath.row].documentUID)
        print("Before deletion")
        print(usages)
        
        firebaseCRUD.deleteDocument(userUID: auth.currentUser!.uid, documentUID: usages[indexPath.row].documentUID)
        // Delete the given row from the table view
        self.usages.remove(at: indexPath.row)
        print("After deletion")
        print(usages)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
 
      }
    }
    
    func populateUsageTextView(usage: Usage) {
        usageTextView.text =
            "You have Streamed \n\tVideo for: \(usage.videoStreamingTime / 60) hours and \(usage.videoStreamingTime % 60) minutes\n" +
            "\tMusic for: \(usage.musicStreamingTime / 60) hours and \(usage.musicStreamingTime % 60) minutes\n" +
            "\tConference for: \(usage.videoConferencingTime / 60) hours and \(usage.videoConferencingTime % 60) minutes\n" +
            "\tSocial Media for: \(usage.soMeTime / 60) hours and \(usage.soMeTime % 60) minutes\n\n" +
            "Which is equal to: \(Calculator(usage: usage).getSum()) km\ndriven in a newer diesel car."
    }
    
    // Function used to get the correct location on the operating system
    func getDocumentDir() -> URL
    {
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentDir[0]
    }

}
