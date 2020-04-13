//
//  Calculator.swift
//  StreamClean
//
//  Created by Rasmus Nielsen on 13/04/2020.
//  Copyright © 2020 Rasmus Nielsen. All rights reserved.
//

import Foundation

class Calculator {
    
    // Create only one calculator to use on all views
    static var calculator = Calculator()
    
    var videoStreamingTime: Int
    var musicStreamingTime: Int
    var generalStreamingTime: Int
    
    init() {
        self.videoStreamingTime = 0
        self.musicStreamingTime = 0
        self.generalStreamingTime = 0
    }
    
    // Weights for determining 1 hours worth of stream in kilometers driven
    // in a newer diesel car.
    // OBS: For now it's just placeholder numbers, will be fixed later
    var videoWeight = 100
    var musicWeight = 10
    var generalWeight = 5
    
    
    func addVideo(usage: Int) {
        videoStreamingTime = videoStreamingTime + usage
    }
    
    func addMusic(usage: Int) {
        musicStreamingTime = musicStreamingTime + usage
    }
    
    // Todo: Add general streaming functionality
    //func addGeneral(usage: Int) {
    //    generalStreamingTime = generalStreamingTime + usage
    //}
    
    func getSum() -> Int {
        let sum = (videoStreamingTime * videoWeight) + (musicStreamingTime * musicWeight)
        return sum
    }
    
}
