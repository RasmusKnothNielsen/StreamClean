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
    var videoConferencingTime: Int
    var SoMeTime: Int
    
    init() {
        self.videoStreamingTime = 0
        self.musicStreamingTime = 0
        self.videoConferencingTime = 0
        self.SoMeTime = 0
    }
    
    // Weights for determining 1 hours worth of stream in kilometers driven
    // in a newer diesel car.
    // OBS: For now it's just placeholder numbers, will be fixed later
    var videoWeight = 20
    var musicWeight = 10
    var videoConferencingWeight = 15
    var SoMeWeight = 5
    
    
    func addVideo(usage: Int) {
        videoStreamingTime += usage
    }
    
    func addMusic(usage: Int) {
        musicStreamingTime += usage
    }
    
    // general streaming functionality
    func addGeneralSoMe(usage: Int) {
        SoMeTime += usage
    }
    func addGeneralVideoConference(usage: Int) {
        videoConferencingTime += usage
    }
    
    func getSum() -> Int {
        let sum =
            ((videoStreamingTime / 60) * videoWeight) +
            ((musicStreamingTime / 60) * musicWeight) +
            ((videoConferencingTime / 60) * videoConferencingWeight) +
            ((SoMeTime / 60) * SoMeWeight)
        return sum
    }
    
}
