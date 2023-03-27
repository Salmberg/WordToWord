//
//  WordData.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-21.
//

import Foundation


struct Word{
    let word: String?
}

class WordDataManager {

       var listOfWords = [Word(word: "Bil"), Word(word: "Katt"), Word(word: "Äpple"), Word(word: "Havet"), Word(word: "Trädgård"), Word(word: "Sjö"), Word(word: "Solen"), Word(word: "Vattenfall"), Word(word: "Vind"), Word(word: "Fjäril"), Word(word: "Vatten"), Word(word: "Flod"), Word(word: "Berg"), Word(word: "Moln"), Word(word: "Regn"), Word(word: "Snö"), Word(word: "Skog"), Word(word: "Mån"), Word(word: "Stjärna"), Word(word: "Jord"), Word(word: "Ö"), Word(word: "Kust"), Word(word: "Vindkraft"), Word(word: "Fisk"), Word(word: "Natur"), Word(word: "Skärgård"), Word(word: "Fågel"), Word(word: "Guldstjärna"), Word(word: "Sommar"), Word(word: "Höst")]
    
    
    func getRandomWord() -> String? {
    let shuffledWords = listOfWords.shuffled()
    return shuffledWords.first?.word
        
        
        

}
    
    
    

   
}

