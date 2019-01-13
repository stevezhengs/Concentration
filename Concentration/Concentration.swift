//
//  Concentration.swift
//  Concentration
//
//  Created by Steve Zheng on 2019/1/13.
//  Copyright © 2019 Steve Zheng. All rights reserved.
//

import Foundation

class Concentration {
    var cards=[Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(index:Int){
        if !cards[index].isMatched{
            if let matchIndex=indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp=false
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=index
            }
            
        }
    }
    init(numberOfPairsOfCard:Int) {
        for _ in 1...numberOfPairsOfCard
        {
            let card=Card()
            cards+=[card,card]
        }
    }
}
