//
//  GameViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {
    
    

    var countdownTimer: Timer!
        var totalTime = 3 // Total time for the countdown timer
        var timeLeft = 3 // Current time left for the countdown timer
        
        @IBOutlet weak var countdownLabel: UILabel!
    
        @IBOutlet weak var wordToWriteLabel: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            
            // Initialize the countdown timer
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        // Function to update the countdown timer
        @objc func updateTimer() {
            if timeLeft > 0 {
                timeLeft -= 1
                countdownLabel.text = "Time left: \(timeLeft)"
            } else {
                endTimer()
            }
        }
        // Function to end the countdown timer
        func endTimer() {
            countdownTimer.invalidate()
            countdownLabel.text = "Time's up!"
        }
}
