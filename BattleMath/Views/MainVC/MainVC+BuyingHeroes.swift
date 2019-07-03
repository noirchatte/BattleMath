//
//  MainVC+BuyingHeroes+extension.swift
//  BattleMath
//
//  Created by админ on 30.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Buying Heroes View

extension MainVC {
    
    func buyHeroe(heroe: Heroes) {
        let cost = heroe.buyingCost
        if cost > player.diamonds {
            showAlert(message: "Недостаточно кристаллов!")
        } else {
            let message = "Ты действительно хочешь купить героя \(heroe.name) за \(heroe.buyingCost) кристаллов?"
            showAlert(title: nil, message: message, cancelButtonNeeded: true) {
                StorageManager.buyHeroe(heroe, player: self.player)
                self.availableHeroes.reloadData()
                self.updatePlayerData()
            }
        }
    }
}
