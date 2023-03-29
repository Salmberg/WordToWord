//
//  HighscoreModel.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-28.
//

import Foundation

class Highscore {
    
   var scores = [HighScoreItem]()
    
    init() {
        add(name: HighScoreItem(name: "Simon", score: 4))
        add(name: HighScoreItem(name: "Anna",score: 7))
        add(name: HighScoreItem(name: "Johanna", score: 8))
    }
    
    var count: Int {
        return scores.count
    }
    
    
    func add(name: HighScoreItem) {
        scores.append(name)
        // scores.append(score)
    }
    
    
    func score(index: Int) -> HighScoreItem? {
        
        if index >= 0 && index < scores.count {
            return scores[index]
        }
        return nil
    }
    
    
}
         
            
