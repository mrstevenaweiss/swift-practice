//
//  Card.swift
//  concentration
//
//  Created by steven weiss on 1/26/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import Foundation


// struct is a value type -- it gets copied

struct Card {

    // vars on unique cards
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // statics on types
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init(identifier: Int) {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
