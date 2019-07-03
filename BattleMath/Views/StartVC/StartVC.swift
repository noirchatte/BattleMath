//
//  ViewController.swift
//  BattleMath
//
//  Created by админ on 12.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    var player = Player()
    private var hardnessLevel: Int?
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var hardnessSegmentedControl: UISegmentedControl!
    @IBOutlet var hardnessDescription: UILabel!
    @IBOutlet var changePlayerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DesignSetup.BackgroundImage("sky.jpg", view: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainVC" {
            let mainVC = segue.destination as! MainVC
            mainVC.player = player
        }
    }
    
    @IBAction func hardnessLevelChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            hardnessLevel = 1
            hardnessDescription.text = DesignSetup.hardnessText[0]
        case 1:
            hardnessLevel = 2
            hardnessDescription.text = DesignSetup.hardnessText[1]
        case 2:
            hardnessLevel = 3
            hardnessDescription.text = DesignSetup.hardnessText[2]
        default:
            hardnessLevel = 1
            hardnessDescription.text = DesignSetup.hardnessText[0]
        }
    }
    
    // MARK: - Setup interface
    
    private func configureUI() {
        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            greetingLabel.text = "Привет, \(playerName)!"
            nameTextField.isHidden = true
            hardnessSegmentedControl.isHidden = true
            hardnessDescription.isHidden = true
        } else {
            greetingLabel.text = "Привет!\nКак тебя зовут?"
            hardnessDescription.text = "\nВыбери начальную сложность игры\n"
            let allPlayers = realm.objects(Player.self)
            changePlayerButton.isHidden = allPlayers.isEmpty ? true : false
        }
    }
}

// MARK: - Buttons pressed

extension StartVC {
    
    @IBAction func startButtonPressed() {
        
        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            let predicate = NSPredicate(format: "name = %@", playerName)
            guard let currentPlayer = realm.objects(Player.self).filter(predicate).first else { return }
            player = currentPlayer
        } else {
            guard let name = nameTextField.text, name != "" else { return }
            guard let hardness = hardnessLevel else { return }
                player = Player(value: [name, 50, 20, hardness, 0, 0, 0,
                                        [["Мишка", "🐻", 1, 1],
                                         ["Зайка", "🐰", 1, 2]]])
                try! realm.write {
                    realm.add(player)
                }
                UserDefaults.standard.set(player.name, forKey: "currentPlayer")
        }
        self.performSegue(withIdentifier: "toMainVC", sender: self)
    }
    
    @IBAction func changePlayerPressed() {
    }
}

