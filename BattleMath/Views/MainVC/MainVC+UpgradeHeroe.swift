//
//  MainVC+UpgradeHeroe+extension.swift
//  BattleMath
//
//  Created by админ on 01.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Upgrade Heroes View

extension MainVC {
    
    func upgradeHeroeWithCoins() {
        let coins = currentHeroe.levelUpCost
        
        if coins > player.coins {
            showAlert(message: "Недостаточно монет, чтобы усилить героя!")
        } else {
            StorageManager.upgradeHeroeWithCoins(player: player, heroe: currentHeroe)
            setupHeroeDetails(heroe: currentHeroe)
            updatePlayerData()
        }
    }
    
    func upgradeHeroeWithDiamonds() {
        let diamonds = currentHeroe.upgradeStarsCost
        
        if diamonds > player.diamonds {
            showAlert(message: "Недостаточно кристаллов, чтобы усилить героя!")
        } else {
            StorageManager.upgradeHeroeWithDiamonds(player: player, heroe: currentHeroe)
            setupHeroeDetails(heroe: currentHeroe)
            updatePlayerData()
        }
    }
    
    func setupHeroeDetails(heroe: Heroes) {
        heroeName.text = "\(heroe.name) (ур. \(heroe.level))\n\(heroe.starsAsStars)"
        heroeIcon.text = heroe.icon
        heroePower.text = "💪🏻 сила: \(heroe.power)"
        coinsButton.setTitle("💰 \(heroe.levelUpCost)", for: .normal)
        diamondsButton.setTitle("💎 \(heroe.upgradeStarsCost)", for: .normal)
        
        if heroe.stars == 5 { diamondsButton.isHidden = true }
        
        heroeIcon.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)
        heroeIcon.layer.cornerRadius = 5
        heroeIcon.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1.0).cgColor
        heroeIcon.layer.borderWidth = 1
    }
}
