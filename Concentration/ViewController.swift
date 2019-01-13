//
//  ViewController.swift
//  Concentration
//
//  Created by Steve Zheng on 2019/1/12.
//  Copyright © 2019 Steve Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipcount:Int = 0 {
        didSet{
            flipCountLabel.text="Flipcount:\(flipcount)"
        }
    }
    var emojiChoices = ["🎃","🌶️","☠️","🐢","🐰","🐭"]
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(emoji: emojiChoices[cardNumber], button: sender)
            print("cardNumber = \(cardNumber)")
        }else{
            print("some card(s) is nil")
        }
    }
    
    
}
func flipCard(emoji:String,button:UIButton){
    if button.currentTitle == emoji{
        button.setTitle("", for: UIControl.State.normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    }else{
        button.setTitle(emoji, for: UIControl.State.normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}



