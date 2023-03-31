

//
//  GameViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-20.
//
import UIKit

class GameViewController: UIViewController {
    
    
    
    let segueIdGOTOFinish = "goToFinsh"
    
    var points = 0
    var countingPoints = 0
    var countdownTimer: Timer!
    var totalTime = 60 // Total time for the countdown timer
    var timeLeft = 60 // Current time left for the countdown timer
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var wordToWriteLabel: UILabel!
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    let wordDataManager = WordDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
        userInputTextField.becomeFirstResponder()
        
        userInputTextField.addTarget(self, action: #selector(checkMatch), for: .editingChanged)
        
    }
    
    @objc func checkMatch(){
        checkAnswer()
    }
    
    func startGame() {
        print("Inside start game")
        countdownTimer?.invalidate()
        resetTimer()
        userInputTextField.text = ""
        getNewWord()
        
    }
    func getNewWord() {
        print("inside getNewWord")
        print(countingPoints)
        if let shuffledWord = wordDataManager.getRandomWord() {
            // Set the text of wordToWriteLabel to the shuffled word
            wordToWriteLabel.text = shuffledWord
            userInputTextField.text = ""
        }
    }
    
    func resetTimer(){
        // Reset the timer
       timeLeft = totalTime
       countdownLabel.text = "Time left: \(timeLeft)"
       countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Function to update the countdown timer
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            countdownLabel.text = "Time left: \(timeLeft)"
            
        } else if (timeLeft == 0) {
            endGame()
        }
    }
    
    func checkAnswer() {
        print("inside checkAnswer")
        
        guard let word = wordToWriteLabel.text,
              let writeWord = userInputTextField.text
        else{
            return
        }
        if word == writeWord {
            countingPoints += 1
            userInputTextField.text = ""
            pointsLabel.text = "Poäng: \(countingPoints)"
            getNewWord()
        }
    }
    
    func endGame(){
       
        //Sending the points to FinishViewController
        if let finalPointsVC = storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as? FinishViewController {
                          finalPointsVC.points = countingPoints
                          present(finalPointsVC, animated: true, completion: nil)
                      }
    }
}
