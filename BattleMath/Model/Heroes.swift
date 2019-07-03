//
//  Heroes.swift
//  BattleMath
//
//  Created by админ on 12.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class Heroes: Object {
    @objc dynamic var name = ""
    @objc dynamic var icon = ""
    @objc dynamic var level = 1
    @objc dynamic var stars = 1
    
    var power: Int {
        return (stars + level) * (stars + level)
    }
    
    var levelUpCost: Int {
        return 10 * (stars + level)
    }
    
    var upgradeStarsCost: Int {
        return stars * 150
    }
    
    var buyingCost: Int {
        return stars * 20
    }
    
    var starsAsStars: String {
        var starsString = ""
        for _ in 1...stars {
            starsString += "⭐️"
        }
        return starsString
    }
}

struct AllHeroes {
    static let allHeroes: [Heroes] = [Heroes(value: ["Мишка", "🐻", 1, 1]),
                                      Heroes(value: ["Зайка", "🐰", 1, 2]),
                                      Heroes(value: ["Котик", "🐱", 1, 1]),
                                      Heroes(value: ["Собачка", "🐶", 1, 2]),
                                      Heroes(value: ["Мышка", "🐭", 1, 3]),
                                      Heroes(value: ["Коровка", "🐮", 1, 4]),
                                      Heroes(value: ["Хомячок", "🐹", 1, 2]),
                                      Heroes(value: ["Лисичка", "🦊", 1, 4]),
                                      Heroes(value: ["Панда", "🐼", 1, 5]),
                                      Heroes(value: ["Лягушка", "🐸", 1, 1]),
                                      Heroes(value: ["Львенок", "🦁", 1, 5]),
                                      Heroes(value: ["Обезьянка", "🐵", 1, 4]),
                                      Heroes(value: ["Коала", "🐨", 1, 3]),
                                      Heroes(value: ["Тигренок", "🐯", 1, 4]),
                                      Heroes(value: ["Свинка", "🐷", 1, 2])]
}

