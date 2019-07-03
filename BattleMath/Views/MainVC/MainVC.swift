//
//  MainVC.swift
//  BattleMath
//
//  Created by админ on 12.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var player: Player!
    var a = 0
    var b = 0
    
    var blackView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var coinsLabel: UILabel!
    @IBOutlet var diamondsLabel: UILabel!
    @IBOutlet var powerLabel: UILabel!
    @IBOutlet var exampleLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var heroesCollectionView: UICollectionView!
    
    // Upgrade Heroe View Elements
    @IBOutlet var upgradeHeroeView: UIView!
    @IBOutlet var heroeName: UILabel!
    @IBOutlet var heroeIcon: UILabel!
    @IBOutlet var heroePower: UILabel!
    @IBOutlet var coinsButton: UIButton!
    @IBOutlet var diamondsButton: UIButton!
    var currentHeroe: Heroes!
    
    // Buying Heroes View Elements
    @IBOutlet var buyingHeroeView: UIView!
    @IBOutlet var availableHeroes: UICollectionView!
    
    // Boss Battle View Elements
    @IBOutlet var bossBattleView: UIView!
    @IBOutlet var bossTitle: UILabel!
    @IBOutlet var bossHPLabel: UILabel!
    @IBOutlet var kicksLabel: UILabel!
    
    // Statistics View Elements
    @IBOutlet var statisticsLabel: UILabel!
    @IBOutlet var statisticsView: UIView!
    var hitsLeft: Int!
    var bossHP: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DesignSetup.BackgroundImage("grass.jpg", view: self.view)
        setupUI()
        setupExample()
        setupBlackView()
        addDoneButtonTo(answerTextField)
    }
    
    // MARK: - Answer button pressed
    
    @IBAction func answerButtonPressed() {
        getAnswer()
    }
    
    // MARK: - Upgrade Heroes
    
    @IBAction func upgradeWithCoins() {
        upgradeHeroeWithCoins()
    }
    
    @IBAction func upgradeWithDiamonds() {
        upgradeHeroeWithDiamonds()
    }
    
    @IBAction func closeHeroeDetails() {
        closeSubview(upgradeHeroeView)
    }
    
    // MARK: - Shop Button Tapped
    
    @IBAction func shopButtonTapped(_ sender: Any) {
        openSubview(buyingHeroeView)
    }
    
    @IBAction func closeShopTapped(_ sender: Any) {
        closeSubview(buyingHeroeView)
    }
    
    // MARK: - Boss Battle
    
    @IBAction func bossBattlestarted() {
        openSubview(bossBattleView)
        configureBattle()
    }
    
    @IBAction func closeBattleView() {
        closeSubview(bossBattleView)
    }
    
    @IBAction func attackBossTapped(_ sender: Any) {
        battleMechanics()
    }
    
    // MARK: - Statistics and settings
    
    @IBAction func setupButtonTapper() {
        openSubview(statisticsView)
        setupStatistics()
    }
    
    @IBAction func closeStatistics() {
        closeSubview(statisticsView)
    }
    
    @IBAction func changePlayer() {
    }
}
