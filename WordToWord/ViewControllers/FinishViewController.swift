//
//  FinishViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-23.
//

import UIKit

class FinishViewController: UIViewController {
    
    let highscoreSegue = "highscoreSegue"
    
    var points: Int?
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var enterNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        enterNameTextField.becomeFirstResponder()
        
        if let unwrappedPoints = points {
            pointsLabel.text = "Nice! You got \(unwrappedPoints) points"
        } else {
            // handle the case where points is nil
        }
        
    }
    
    @IBAction func saveScore(_ sender: Any) {
        
        performSegue(withIdentifier: "highscoreSegue", sender: self)
        enterNameTextField.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "highscoreSegue" {
            if let destinationVC = segue.destination as? HighScoreViewController {
                if let name = enterNameTextField.text, let points = points {
                    destinationVC.addHighScore(name: name, points: points)
                }
            }
        }
    }

}
