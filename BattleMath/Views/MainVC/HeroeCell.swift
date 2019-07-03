//
//  HeroeCell.swift
//  BattleMath
//
//  Created by админ on 17.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

class HeroeCell: UICollectionViewCell {
    
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroeIcon: UILabel!
    @IBOutlet var heroePower: UILabel!
    
    func heroeCellSetup(_ heroe: Heroes) {
        
        switch heroe.stars {
        case 1: self.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 0.5)
        case 2: self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 0.5)
        case 3: self.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.5)
        case 4: self.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0.5)
        case 5: self.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 0.5)
        default: self.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 0.5)
        }

        heroName.text = "\(heroe.name) (ур.\(heroe.level))\n\(heroe.starsAsStars)"
        heroeIcon.text = heroe.icon
        heroePower.text = "💪🏻 сила: \(heroe.power)"
        
        heroeIcon.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        heroeIcon.layer.cornerRadius = 5
        heroeIcon.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        heroeIcon.layer.borderWidth = 1
    }
}
