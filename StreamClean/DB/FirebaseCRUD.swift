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
    private static let db = Firestore.firestore()
    
    
    // CREATE
    
    // Create a document in a users collection
    func createDocument(userUID: String, usage: Usage) {
        let docRef = FirebaseCRUD.db.collection(userUID).document()
        // Create new usage object with the documentID generated from firebase
        let newUsage = Usage(documentID: docRef.documentID, videoStreamingTime: usage.videoStreamingTime, musicStreamingTime: usage.musicStreamingTime, videoConferenceTime: usage.videoConferencingTime, soMeTime: usage.soMeTime)
        
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
        //TODO: Filler data, replace with actual code
        let usage = Usage(videoStreamingTime: 1, musicStreamingTime: 1, videoConferenceTime: 1, soMeTime: 1)
        return [usage]
    }
    
    // Read specific document from users collection
    func readDocument(userUID: String, documentUID: String) -> Usage {
        //TODO: Filler data, replace with actual code
        let usage = Usage(videoStreamingTime: 1, musicStreamingTime: 1, videoConferenceTime: 1, soMeTime: 1)
        return usage
    }
    
    // UPDATE
    
    // Update specific document in users collection
    func updateDocument(userUID: String, documentUID: String) -> Bool {
        return false
    }
    
    
    // DELETE
    
    // Delete specific document in users collection
    func deleteDocument(userUID: String, documentUID: String) -> Bool {
        return false
    }
    
    // Delete all documents in users collection
    func deleteAllDocuments(userUID: String) -> Bool {
        return false
    }
    
    // Delete users collection
    func deleteCollection(UserUID: String) -> Bool {
        return false
    }
    
    
}
