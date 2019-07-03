//
//  MainVC+BossBattle+Extension.swift
//  BattleMath
//
//  Created by админ on 30.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Boss Battle View

extension MainVC {
    
    func battleMechanics() {
        hitsLeft -= 1
        let power = player.power
        let hitPower = Int.random(in: power / 2 ... power)
        
        if bossHP > hitPower {
            bossHP -= hitPower
            bossHPLabel.text = "Осталось: \(bossHP ?? 0) очков здоровья"
            kicksLabel.text = "Осталось попыток: \(hitsLeft ?? 0)"
        } else {
            battleResults(true)
        }
        
        if hitsLeft == 0 && bossHP > 0 {
            battleResults(false)
        }
    }
    
    func battleResults(_ result: Bool) {
        var title = ""
        var message = ""
        var prize = 0
        
        if result {
            prize = (player.bossDefeatedTimes + 1) * 10
            StorageManager.bossDefeatedReward(player: player, prize: prize)
            setupUI()
            title = "Победа!"
            message = "Молодец! Босс повержен!\nТы получаешь награду \(prize) кристаллов!"
        } else {
            title = "Увы..."
            message = "В этот раз не удалось победить Босса! Реши еще несколько примеров и усиль своих героев!"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.configureBattle()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func configureBattle() {
        hitsLeft = 10
        bossHP = (player.bossDefeatedTimes + 1) * 350
        bossTitle.text = "Босс уровень \(player.bossDefeatedTimes + 1)"
        bossHPLabel.text = "Осталось: \(bossHP ?? 0) очков здоровья"
        kicksLabel.text = "Осталось попыток: \(hitsLeft ?? 0)"
    }
    
}
