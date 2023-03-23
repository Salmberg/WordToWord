

//
//  GameViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-20.
//
import UIKit

class GameViewController: UIViewController,UITextFieldDelegate {
    
    let segueIdGOTOFinish = "goToFinsh"
    
    var rounds = -1
    var points: Int? = 0
    var countdownTimer: Timer!
    var totalTime = 10 // Total time for the countdown timer
    var timeLeft = 10 // Current time left for the countdown timer
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var wordToWriteLabel: UILabel!
    
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    let wordDataManager = WordDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("from the top")
        
        userInputTextField.becomeFirstResponder()
        userInputTextField.delegate = self
        
        startGame()
        isSeguePerformed = false // reset the flag
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("going to checkAnswer()")
        checkAnswer()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAnswer()
    }
    
    func startGame(){
        print("inside startGame")
        points = 1
        getNewWord()
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
        print("inside getNewWord")
        //Invalidates the old timer
        countdownTimer?.invalidate()
        if let shuffledWord = wordDataManager.getRandomWord() {
            // Set the text of wordToWriteLabel to the shuffled word
            wordToWriteLabel.text = shuffledWord
            userInputTextField.text = ""
            
            //Start a new round
            if rounds < 10 {
                rounds += 1
                roundsLabel.text = "Round: \(rounds )"
            } else {
                print("first segue in if statement")
                self.performSegue(withIdentifier: "goToFinish", sender: nil)
                
                //Reset rounds
                rounds = -1
            }
            
            
            //Reset rounds
            
            
            // Reset the timer
            timeLeft = totalTime
            countdownLabel.text = "Time left: \(timeLeft)"
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    
    var isSeguePerformed = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("func prepare")
        if segue.identifier == "goToFinish" {
            if let destinationVC = segue.destination as? FinishViewController, let currentPoints = points {
                if rounds >= 10 {
                    destinationVC.points = currentPoints
                } else {
                    // Don't perform the segue if rounds is less than 10
                    // You can also display an alert to inform the user
                    // that they need to complete at least 10 rounds
                }
            }
        }
    }
    
    func checkAnswer() {
        print("inside checkAnswer")
        let wordToWrite = wordToWriteLabel.text
        let userInput = userInputTextField.text
        print("wordToWrite: \(String(describing: wordToWrite))")
        print("userInput: \(String(describing: userInput))")
        if wordToWrite == userInput {
            print("Rätt!")
            getNewWord()
            // The user input matches the displayed word
            // Add a point to the points variable
            if let currentPoints = points {
                points = currentPoints + 1
            } else {
                points = -1
                
            }
            pointsLabel.text = "Points: \(points ?? 0)"
            
        } else {
            getNewWord()
            
            // The user input does not match the displayed word
            // Subtract one point from the points variable
            if let currentPoints = points {
                points = currentPoints - 1
            } else {
                points = -1
                
            }
            pointsLabel.text = "Points: \(points ?? 0)"
        }
    }
    
}
