//
//  MainVC+UISetup.swift
//  BattleMath
//
//  Created by админ on 02.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Setup UI

extension MainVC {
    
    func setupUI() {
        nameLabel.text = player.name
        coinsLabel.text = "💰 \(player.coins)"
        diamondsLabel.text = "💎 \(player.diamonds)"
        powerLabel.text = "💪🏻 \(player.power)"
    }
    
    func updatePlayerData() {
        setupUI()
        heroesCollectionView.reloadData()
    }
    
    func setupBlackView() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        blackView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)
        blackView.isHidden = true
        view.addSubview(blackView)
    }
    
    func openSubview(_ subview: UIView) {
        blackView.isHidden = false
        view.addSubview(subview)
        subview.center = self.view.center
    }
    
    func closeSubview(_ subview: UIView) {
        blackView.isHidden = true
        subview.removeFromSuperview()
    }
}
