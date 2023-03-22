//
//  GameViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController,UITextFieldDelegate {
    
    var rounds: Int? = 0
    var points: Int? = 0
    var countdownTimer: Timer!
    var totalTime = 5 // Total time for the countdown timer
    var timeLeft = 5 // Current time left for the countdown timer
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var wordToWriteLabel: UILabel!
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    let wordDataManager = WordDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInputTextField.becomeFirstResponder()
        
        userInputTextField.delegate = self
        
       
        getNewWord()
            
           
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAnswer()
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
            userInputTextField.text = ""
            checkAnswer()
            getNewWord()
           
        }
        func getNewWord() {
            if let shuffledWord = wordDataManager.getRandomWord() {
                // Set the text of wordToWriteLabel to the shuffled word
                wordToWriteLabel.text = shuffledWord
                
                // Reset the timer
                timeLeft = totalTime
                countdownLabel.text = "Time left: \(timeLeft)"
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
    
    func checkAnswer() {
        let wordToWrite = wordToWriteLabel.text
        let userInput = userInputTextField.text
        print("wordToWrite: \(wordToWrite)")
        print("userInput: \(userInput)")
        if wordToWrite == userInput {
            print("Rätt!")
            // The user input matches the displayed word
            // Add a point to the points variable
            if let currentPoints = points {
                points = currentPoints + 1
            } else {
                points = 1
            }
            pointsLabel.text = "Points: \(points ?? 0)"
        } else {
            // The user input does not match the displayed word
            // Do something to indicate that they got it wrong
        }
    }




    }
    


