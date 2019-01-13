//
//  ViewController.swift
//  Concentration
//
//  Created by Steve Zheng on 2019/1/12.
//  Copyright © 2019 Steve Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game=Concentration(numberOfPairsOfCard: (cardButtons.count+1) / 2)
    
    var flipcount:Int = 0 {
        didSet{
            flipCountLabel.text="Flipcount:\(flipcount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(index: cardNumber)
            updateViewFromModel()
        }else{
            print("some card(s) is nil")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button=cardButtons[index]
            let card=game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃","🌶️","☠️","🐢","🐰","🐭","🐯","🍉"]
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil,emojiChoices.count>0{
            let randomIndex=Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
            
        }
        //        if(emoji[card.identifier] != nil){
        //            return emoji[card.identifier]!
        //        }else{
        //            return "?"}
        return emoji[card.identifier] ?? "?"
    }
    
    
}




