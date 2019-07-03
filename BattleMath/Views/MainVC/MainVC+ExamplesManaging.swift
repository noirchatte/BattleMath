//
//  ExamplesManager.swift
//  BattleMath
//
//  Created by админ on 17.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Examples Managing

extension MainVC {
    
    func generateAB(player: Player) -> (a: Int, b: Int) {
        let randomSymbol = Int.random(in: 0...1)
        let minLimit = player.hardnessLevel * 2
        let a = Int.random(in: minLimit...player.limit)
        var b = 0
        
        switch randomSymbol {
        case 0: b = Int.random(in: minLimit...player.limit)
        default: b = -1 * Int.random(in: player.hardnessLevel...a - 1)
        }
        
        return (a, b)
    }
    
    func setupExample() {
        answerTextField.text = ""
        (a, b) = generateAB(player: player)
        if b > 0 {
            exampleLabel.text = "\(a) + \(b) ="
        } else {
            exampleLabel.text = "\(a) - \(-1 * b) ="
        }
        answerTextField.textColor = .black
    }
    
    func getAnswer() {
        var title = ""
        var message = ""
        var correct = true
        
        if let answer = answerTextField.text, answer != "" {
            guard let answerInt = Int(answer) else { return }
            if answerInt == a + b {
                correct = true
                title = "Верно!"
                message = "Молодец! Так держать!\nТы получаешь 10 монет!"
            } else {
                correct = false
                title = "Неверно."
                message = "Увы, не вышло...\nТы получаешь 3 монеты."
                answerTextField.text = "\(a + b)"
                answerTextField.textColor = .red
            }
        }
        
        showAlert(title: title, message: message) {
            StorageManager.answerReward(player: self.player, answerIsCorrect: correct)
            self.setupUI()
            self.setupExample()
        }
    }
}
