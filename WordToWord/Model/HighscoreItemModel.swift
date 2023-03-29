//
//  HighscoreModel.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-28.
//

import Foundation


struct HighScoreItem {
    
    var name : String
    var score : Int
    var date : Date
    
    
    init(name: String,score : Int) {
        self.name = name
        self.score = score
        self.date = Date()
    }
}
