//
//  HighScoreViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-29.
//

import UIKit

class HighScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var highScores: [[String: Any]] = []
    

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(highScores)
        
        //UserDefaults.standard.removeObject(forKey: "highScores")

        // Set up the table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HighScoreCell")

        getHighScores()

        // Sort the high scores in descending order based on points
        highScores.sort { ($0["points"] as? Int ?? 0) > ($1["points"] as? Int ?? 0) }

        // Reload the table view
        tableView.reloadData()
    }
    
    func getHighScores() {
        // Retrieve high scores from UserDefaults
        let defaults = UserDefaults.standard
        if let savedHighScores = defaults.array(forKey: "highScores") as? [[String: Any]] {
            highScores = savedHighScores
            print(savedHighScores)
        }
    }

    func saveHighScores() {
        let defaults = UserDefaults.standard
        defaults.set(highScores, forKey: "highScores")
    }

    func addHighScore(name: String, points: Int) {
        
        getHighScores()
        
        // Check if the new score already exists in the array
        let existingScore = highScores.first { score in
            return score["name"] as? String == name && score["points"] as? Int == points
        }
        
        if existingScore == nil {
            // If the new score doesn't exist, add it to the array
            let newScore: [String: Any] = ["name": name, "points": points]
            highScores.append(newScore)
            
            // Sort the high scores in descending order based on points
            highScores.sort { ($0["points"] as? Int ?? 0) > ($1["points"] as? Int ?? 0) }
            
            // Remove any scores beyond the top 3
            if highScores.count > 3 {
                highScores.removeLast(highScores.count - 3)
            }
            
            // Save the updated high scores to UserDefaults and reload the table view
            saveHighScores()
            if let tableView = tableView {
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath)
        let score = highScores[indexPath.row]
        if let name = score["name"] as? String, let points = score["points"] as? Int {
            cell.textLabel?.text = "\(name): \(points)"
        }
        return cell
    }
}


