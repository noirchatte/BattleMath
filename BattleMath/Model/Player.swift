//
//  Player.swift
//  BattleMath
//
//  Created by админ on 01.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object {
    @objc dynamic var name = ""
    @objc dynamic var coins = 100
    @objc dynamic var diamonds = 10
    @objc dynamic var hardnessLevel = 1
    @objc dynamic var solvedExamples = 0
    @objc dynamic var totalExamples = 0
    @objc dynamic var bossDefeatedTimes = 0
    let heroes = List<Heroes>()
    let battleSet = List<Heroes>()
    @objc dynamic var currentTheme = "GreenGrass"
    
    var limit: Int {
        return solvedExamples / 20 + 5 * hardnessLevel
    }
    
    var power: Int {
        var playerPower = 0
        for i in 0..<heroes.count {
            playerPower += heroes[i].power
        }
        return playerPower
    }
    
    var sortedByStars: [Heroes] {
        return heroes.sorted(by: { $0.stars == $1.stars ? $0.power > $1.power : $0.stars > $1.stars })
    }
    
    var unownedHeroes: [Heroes] {
        var unowned = AllHeroes.allHeroes
        
        for heroe in heroes {
            if let index = unowned.firstIndex(where: { $0.name == heroe.name }) {
                unowned.remove(at: index)
            }
        }
        return unowned.sorted(by: { $0.stars < $1.stars })
    }
}

