//
//  HighScoreViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-29.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    var name: String?
    var points: Int?
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Retrieve name and points from UserDefaults
            let defaults = UserDefaults.standard
            if let name = defaults.string(forKey: "name") {
                nameLabel.text = "Player \(name): "
            }
            if let points = defaults.object(forKey: "points") as? Int {
                pointsLabel.text = "has \(points) points"
            }
    }
    
}
