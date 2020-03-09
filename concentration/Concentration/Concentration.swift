//
//  Concentration.swift
//  concentration
//
//  Created by steven weiss on 1/26/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import Foundation

// whenever i build a new class, what is its public API
// API is simply the methods and instance variables of the class
// public API is the methods/instance variables you allow other classes to call

class Concentration {
    
    var cards = [Card]()
    func chooseCards(at index: Int) {}
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            // cards += [card, card]
        }
        // TODO: Shuffle Cards
    }


}
 
