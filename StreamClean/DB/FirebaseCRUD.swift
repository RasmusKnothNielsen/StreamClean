//
//  FirebaseCRUD.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 18/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirebaseCRUD {
    
    // Instance of database connection
    static let db = Firestore.firestore()
    
    
    // CREATE
    
    // Create a document in a users collection
    func createDocument(userUID: String, usage: Usage) {
        let docRef = FirebaseCRUD.db.collection(userUID).document()
        
        // Create map with information from usage
        var map = [String:Any]()
        map["videoStreamingTime"] = usage.videoStreamingTime
        map["musicStreamingTime"] = usage.musicStreamingTime
        map["videoConferenceTime"] = usage.videoConferencingTime
        map["soMeTime"] = usage.soMeTime
        map["date"] = usage.date
        
        // Upload data to firestore
        docRef.setData(map)
        print("Document created with id: \(docRef.documentID)")
    }
    
    
    // READ
    
    // Read all documents from users collection
    func readAllDocuments(userUID: String) -> [Usage] {
        // Initialize Usage array to be appended to
        var data: [Usage] = []
        FirebaseCRUD.db.collection(userUID).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error when retrieving all documents. \(err)")
            }
            else {
                print("Got all documents from Firestore")
                for document in querySnapshot!.documents {
                    // Get a map of data from the document
                    let map = document.data()
                    let documentUID = document.documentID
                    let videoStreamingTime = map["videoStreamingTime"] as! Int
                    let musicStreamingTime = map["musicStreamingTime"] as! Int
                    let videoConferenceTime = map["videoConferenceTime"] as! Int
                    let soMeTime = map["soMeTime"] as! Int
                    //let date = map["date"] as! Date
                    
                    // Create Usage object
                    let usage = Usage(documentID: documentUID, videoStreamingTime: videoStreamingTime, musicStreamingTime: musicStreamingTime, videoConferenceTime: videoConferenceTime, soMeTime: soMeTime)
                    
                    // DEBUG
                    print("DocumentID: \(documentUID)")
                    print("\tVideo streaming time: \(videoStreamingTime)")
                    print("\tMusic streaming time: \(musicStreamingTime)")
                    
                    // Append to array
                    data.append(usage)
                }
            }
        }
        return data
    }
    
    
    // Read specific document from users collection
    func readDocument(userUID: String, documentUID: String) -> Usage {
        
        // Create field to hold data from query and fill it with dummy data.
        var result: Usage = Usage(videoStreamingTime: 0, musicStreamingTime: 0, videoConferenceTime: 0, soMeTime: 0)
        
        let docRef = FirebaseCRUD.db.collection(userUID).document(documentUID)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                // Get a map of data from the document
                let map = document.data()
                let documentUID = document.documentID
                let videoStreamingTime = map!["videoStreamingTime"] as! Int
                let musicStreamingTime = map!["musicStreamingTime"] as! Int
                let videoConferenceTime = map!["videoConferenceTime"] as! Int
                let soMeTime = map!["soMeTime"] as! Int
                let date = map!["date"] as! Date
                
                // Create Usage object
                result = Usage(documentID: documentUID, videoStreamingTime: videoStreamingTime, musicStreamingTime: musicStreamingTime, videoConferenceTime: videoConferenceTime, soMeTime: soMeTime, date: date)
                
            }
        }
        
        return result
    }
    
    // UPDATE
    
    // Update specific document in users collection
    func updateDocument(userUID: String, documentUID: String, key: String, value: String) {
        FirebaseCRUD.db.collection(userUID).document(documentUID).updateData([key : value])
    }
    
    
    // DELETE
    
    // Delete specific document in users collection
    func deleteDocument(userUID: String, documentUID: String) {
        FirebaseCRUD.db.collection(userUID).document(documentUID).delete() { err in
            if let err = err {
                print("Error: \(err.localizedDescription) occured when trying to delete document: \(documentUID) in collection: \(userUID)")
            } else {
                print("\(documentUID) successfully deleted from collection: \(userUID)")
            }
        }
    }
    
    // Delete all documents in users collection and thus deleting the whole collection
    func deleteAllDocuments(userUID: String) {
        // Get list of documentUIDs from userUID collection
        FirebaseCRUD.db.collection(userUID).getDocuments { (querySnapshot, err) in
        if let err = err {
            print("Error when retrieving all documents. \(err)")
        }
        else {
            print("Got all documents from Firestore")
            for document in querySnapshot!.documents {
                // Call deleteDocument on each of them
                self.deleteDocument(userUID: userUID, documentUID: document.documentID)
                }
            }
            print("All documents in collection: \(userUID) is now deleted")
        }
    }
    
    
}
