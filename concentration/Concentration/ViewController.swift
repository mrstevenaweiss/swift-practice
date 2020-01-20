//
//  ViewController.swift
//  concentration
//
//  Created by steven weiss on 1/18/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Instance Variable , must initalize variables
    // Use didSet, propertyObserver to manage DRY
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    // Labels Count Outlet
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🐻","🐼","🐧","🐻"]
    
    // Actions Connecting the cards
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
//        flipCard(withEmoji: "🐼", on: sender)
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Not working")
        }

    }
    
    // Logic for what happens when you do the Action
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji:) \(emoji)" )
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9713788629, green: 0.5313149691, blue: 0.2068626881, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
    }

}


