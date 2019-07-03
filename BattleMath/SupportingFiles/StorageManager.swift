//
//  StorageManager.swift
//  BattleMath
//
//  Created by админ on 02.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import Foundation
import RealmSwift

class StorageManager {
    
    static func answerReward(player: Player, answerIsCorrect: Bool) {
        try! realm.write {
            player.coins += answerIsCorrect ? 10 : 10
            player.totalExamples += 1
            player.solvedExamples += answerIsCorrect ? 1 : 0
            if player.solvedExamples % 10 == 0 {
                player.diamonds += 1
            }
        }
    }
    
    static func buyHeroe(_ heroe: Heroes, player: Player) {
        try! realm.write {
            player.diamonds -= heroe.buyingCost
            player.heroes.append(heroe)
        }
    }
    
    static func upgradeHeroeWithCoins(player: Player, heroe: Heroes) {
        try! realm.write {
            player.coins -= heroe.levelUpCost
            heroe.level += 1
        }
    }
    
    static func upgradeHeroeWithDiamonds(player: Player, heroe: Heroes) {
        try! realm.write {
            player.coins -= heroe.upgradeStarsCost
            heroe.level += 1
        }
    }
    
    static func bossDefeatedReward(player: Player, prize: Int) {
        try! realm.write {
            player.diamonds += prize
            player.bossDefeatedTimes += 1
        }
    }
}
