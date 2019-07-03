//
//  MainVC+CollectionView+Extension.swift
//  BattleMath
//
//  Created by админ on 01.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Collection View Delegate Methods

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0: return player.heroes.count
        case 1: return player.unownedHeroes.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroeCell", for: indexPath) as! HeroeCell
            let heroe = player.sortedByStars[indexPath.row]
            cell.heroeCellSetup(heroe)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BuyingHeroCell
            let heroe = player.unownedHeroes[indexPath.row]
            cell.configureCell(heroe)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 0:
            openSubview(upgradeHeroeView)
            currentHeroe = player.sortedByStars[indexPath.item]
            setupHeroeDetails(heroe: currentHeroe)
        case 1:
            let heroe = player.unownedHeroes[indexPath.item]
            buyHeroe(heroe: heroe)
        default: break
        }
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            let width = (UIScreen.main.bounds.width - 20) / 3
            var height: CGFloat = 0
            
            if UIScreen.main.bounds.width < 350 {
                height = width / 0.5
            } else {
                height = width / 0.65
            }
            
            return CGSize(width: width, height: height)
        }
        else {
            return CGSize(width: 120, height: 150)
        }
    }
}
