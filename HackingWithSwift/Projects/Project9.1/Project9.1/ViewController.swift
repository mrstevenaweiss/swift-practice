//
//  ViewController.swift
//  Project9.1
//
//  Created by steven weiss on 5/21/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Hold a list of random words
    var allWords = [String]()
    var chars = [Character]()

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // Get a list of random words
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        // Generate a random word
        func startGame() {
            title = allWords.randomElement()
            chars.removeAll(keepingCapacity: true)
            let wordIdx = Int.random(in: 1..<10000)
            print(allWords[wordIdx])
        }
        startGame()

        // Show the word as underscores for any word length
        let hangmanClue = UILabel()
        hangmanClue.translatesAutoresizingMaskIntoConstraints = false
        hangmanClue.textAlignment = .center
        hangmanClue.text = "? ? ? ? ? ? ? ?"
        view.addSubview(hangmanClue)

        NSLayoutConstraint.activate([
            hangmanClue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hangmanClue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            hangmanClue.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        // Track incorrect guesses
        // Show an alert if they get the word
        // Show an alert if the letter is incorrect
        // End game if incorrectTracker == 7
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

