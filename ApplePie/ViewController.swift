//
//  ViewController.swift
//  ApplePie
//
//  Created by Daniel Kwiatkowski on 2017-06-05.
//  Copyright © 2017 Spiffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create an instance of the game in the to hold the game's value that it can controlled throughout the 
    //controller
    var currentGame : Game!
    
    
    //created local variables in the controller to guess up to 7 times
    //this array holds random words and to keep things simple we use lower case words
    var listOfWords = ["apple", "orange", "blue", "red", "glorious", "beautiful", "stuff"]
    let incorrectMovesAllowed = 7
    
    //the bottom label will display an updated count of the number of wins and losses
    //created 2 variables to hold each value and set the intial value to 0
    var totalWins = 0
    var totalLosses = 0
    
    
    
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //outlet collection that has all the buttons connected
    @IBOutlet var letterButtons: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //each round begins the selection of a new word
        //resetting the moves the player can make 
        newRound()
    }

    func newRound() {
        let newWord = listOfWords.removeFirst()
        //updated intialization of struct
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
        
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        //the image changes everytime you update the UI
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        //this reads the buttons title to determine if letter in the word is trying to guess
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        //everytime the user presses a button it gets added to the collection
        print(currentGame.guessedLetters)
        updateUI()
        
    }

}

