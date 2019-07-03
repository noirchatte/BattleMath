//
//  BuyingHeroCell.swift
//  BattleMath
//
//  Created by админ on 23.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

class BuyingHeroCell: UICollectionViewCell {
    
    @IBOutlet var heroIconLabel: UILabel!
    @IBOutlet var nameAndStars: UILabel!
    @IBOutlet var costLabel: UILabel!
    
    func configureCell(_ heroe: Heroes) {
        heroIconLabel.text = heroe.icon
        nameAndStars.text = "\(heroe.name)\n\(heroe.starsAsStars)"
        costLabel.text = "💎 \(heroe.buyingCost)"
        
        heroIconLabel.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        heroIconLabel.layer.cornerRadius = 5
        heroIconLabel.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        heroIconLabel.layer.borderWidth = 1
    }
}
