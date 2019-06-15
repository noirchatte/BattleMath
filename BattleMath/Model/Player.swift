//
//  Player.swift
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
    @objc dynamic var level = 0
}

class Player: Object {
    @objc dynamic var name = ""
    @objc dynamic var coins = 100
    @objc dynamic var solvedExamples = 0
    @objc dynamic var totalExamples = 0
    let heroes = List<Heroes>()
}
