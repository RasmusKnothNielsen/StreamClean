//
//  Usage.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 18/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import Foundation

// Class to hold a specific users usage in a specific week
class Usage {
    
    var documentUID: String
    
    var videoStreamingTime: Int
    var musicStreamingTime: Int
    var videoConferencingTime: Int
    var SoMeTime: Int
    
    init(videoStreamingTime: Int,
         musicStreamingTime: Int,
         videoConferenceTime: Int,
         soMeTime: Int) {
        self.videoStreamingTime = videoStreamingTime
        self.musicStreamingTime = musicStreamingTime
        self.videoConferencingTime = videoConferenceTime
        self.SoMeTime = soMeTime
        self.documentUID = UUID().uuidString
    }
    
}
