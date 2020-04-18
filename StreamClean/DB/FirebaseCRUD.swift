//
//  FirebaseCRUD.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 18/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import Foundation

class FirebaseCRUD {
    
    // CREATE
    
    // Create collection with the users UID
    func createCollection(userUID: String) -> Bool {
        return false
    }
    
    // Create a document in a users collection
    func createDocument(userUID: String, usage: Usage) -> Bool {
        return false
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
