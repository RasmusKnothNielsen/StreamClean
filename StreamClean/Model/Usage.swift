//
//  Usage.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 18/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import Foundation

// Class to hold users usage in a specific week
class Usage {
    
    var documentUID: String
    
    var videoStreamingTime: Int
    var musicStreamingTime: Int
    var videoConferencingTime: Int
    var soMeTime: Int
    var date: Date
    
    // Empty constructor
    init() {
        self.documentUID = ""
        self.videoStreamingTime = 0
        self.musicStreamingTime = 0
        self.videoConferencingTime = 0
        self.soMeTime = 0
        self.date = Date()
    }
    
    // Constructor with DocumentID
    init(documentID: String,
         videoStreamingTime: Int,
         musicStreamingTime: Int,
         videoConferenceTime: Int,
         soMeTime: Int,
         date: Date) {
        self.documentUID = documentID
        self.videoStreamingTime = videoStreamingTime
        self.musicStreamingTime = musicStreamingTime
        self.videoConferencingTime = videoConferenceTime
        self.soMeTime = soMeTime
        self.date = date
    }
    
    // Constructor without DocumentID
    init(videoStreamingTime: Int,
     musicStreamingTime: Int,
     videoConferenceTime: Int,
     soMeTime: Int) {
        self.videoStreamingTime = videoStreamingTime
        self.musicStreamingTime = musicStreamingTime
        self.videoConferencingTime = videoConferenceTime
        self.soMeTime = soMeTime
        self.documentUID = ""
        self.date = Date()
    }
    
    // Constructor with the calculator object
    init(calculator: Calculator) {
        self.videoStreamingTime = calculator.videoStreamingTime
        self.musicStreamingTime = calculator.musicStreamingTime
        self.videoConferencingTime = calculator.videoConferencingTime
        self.soMeTime = calculator.soMeTime
        self.documentUID = ""
        self.date = Date()
    }
    
    // TEST Init
    // Constructor with DocumentID
    init(documentID: String,
         videoStreamingTime: Int,
         musicStreamingTime: Int,
         videoConferenceTime: Int,
         soMeTime: Int) {
        self.documentUID = documentID
        self.videoStreamingTime = videoStreamingTime
        self.musicStreamingTime = musicStreamingTime
        self.videoConferencingTime = videoConferenceTime
        self.soMeTime = soMeTime
        self.date = Date()
    }
    
}
