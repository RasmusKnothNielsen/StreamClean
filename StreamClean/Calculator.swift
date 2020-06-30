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
    var soMeTime: Int
    
    init() {
        self.videoStreamingTime = 0
        self.musicStreamingTime = 0
        self.videoConferencingTime = 0
        self.soMeTime = 0
    }
    
    // Constructor for when we need to add a whole session
    init(usage: Usage) {
        self.videoStreamingTime = usage.videoStreamingTime
        self.musicStreamingTime = usage.musicStreamingTime
        self.videoConferencingTime = usage.videoConferencingTime
        self.soMeTime = usage.soMeTime
    }
    
    // Weights for determining 1 hours worth of stream in kilometers driven
    // in a newer diesel car.
    // OBS: For now it's just placeholder numbers, will be fixed later
    var videoWeight = 20
    var musicWeight = 10
    var videoConferencingWeight = 15
    var soMeWeight = 5
    
    
    func addVideo(usage: Int) {
        videoStreamingTime += usage
    }
    
    func addMusic(usage: Int) {
        musicStreamingTime += usage
    }
    
    // general streaming functionality
    func addGeneralSoMe(usage: Int) {
        soMeTime += usage
    }
    func addGeneralVideoConference(usage: Int) {
        videoConferencingTime += usage
    }
    
    func getSum() -> Int {
        let sum =
            ((videoStreamingTime / 60) * videoWeight) +
            ((musicStreamingTime / 60) * musicWeight) +
            ((videoConferencingTime / 60) * videoConferencingWeight) +
            ((soMeTime / 60) * soMeWeight)
        return sum
    }
    
    func getAverageOfDocuments(userUID: String, vc: ResultViewController) {
        
        var collectionOfSum: [Int] = []
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
                let usage = Usage(documentID: documentUID, videoStreamingTime: videoStreamingTime, musicStreamingTime: musicStreamingTime, videoConferenceTime: videoConferenceTime, soMeTime: soMeTime, date: Date())
                
                let calc = Calculator.init(usage: usage)
                let result = calc.getSum()
                collectionOfSum.append(result)
            }
            let sum = collectionOfSum.reduce(0, { x, y in
                x + y
            })
            let result = sum / collectionOfSum.count
            
            var text = ""
            
            var startText = "Your average streaming consumption is approximately"
            if userUID == "John Doe" {
                startText = "The average of our anonymous users streaming consumption is approximately"
            }
            
            let currentUsage = self.getSum()
            
            // If the user has a lower usage than the average
            if result > currentUsage {
                let percentageDifference : Double = (Double(result - currentUsage) / Double(result)) * 100
                text = "\(startText) \(Int(percentageDifference))% higher than your entered usage, congratulation!\n Average is: \(result)"
                vc.view.backgroundColor = .green
                vc.resultView.backgroundColor = .green
                vc.comparisonView.backgroundColor = .green
            }
            // if the user had a higher usage than the average
            else if result < currentUsage {
                let percentageDifference : Double = ((Double(currentUsage) / Double(result) * 100) - 100)
                text = "\(startText) \(Int(percentageDifference))% lower than your entered usage!\n Average is: \(result)"
                vc.view.backgroundColor = .red
                vc.resultView.backgroundColor = .red
                vc.comparisonView.backgroundColor = .red
            }
            // If the user hit the same amount of usage as the average
            else {
                text = "You managed to hit your average; Not worse, not better."
                vc.view.backgroundColor = .blue
                vc.resultView.backgroundColor = .blue
                vc.comparisonView.backgroundColor = .blue

            }
            
            vc.comparisonView.text = text
            }
        }
    }
    
}
