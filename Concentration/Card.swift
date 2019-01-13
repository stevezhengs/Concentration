//
//  Card.swift
//  Concentration
//
//  Created by Steve Zheng on 2019/1/13.
//  Copyright © 2019 Steve Zheng. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    static var identifierFactory=0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory+=1
        return identifierFactory
    }
    
    init() {
        self.identifier=Card.getUniqueIdentifier()
    }
}
