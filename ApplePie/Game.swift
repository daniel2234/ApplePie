//
//  Game.swift
//  ApplePie
//
//  Created by Daniel Kwiatkowski on 2017-06-07.
//  Copyright © 2017 Spiffy. All rights reserved.
//

import Foundation


//instance of game has two properties, the word, and the number of turns you have left to properly guess the word
struct Game {
    var word : String
    var incorrectMovesRemaining : Int
    //this collection is to tell the game which letters have been selected
    var guessedLetters: [Character]
    
    //this method adds a character to the collection and updates the incorrect moves remaining if necessary
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
    
    
}
