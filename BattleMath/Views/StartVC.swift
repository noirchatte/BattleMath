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
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var changePlayerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            greetingLabel.text = "Привет, \(playerName)!"
            nameTextField.isHidden = true
        } else {
            greetingLabel.text = "Привет!\nКак тебя зовут?"
            changePlayerButton.isHidden = true
        }
    }
    
    func viewWillAppear() {
        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            greetingLabel.text = "Привет, \(playerName)!"
            nameTextField.isHidden = true
        } else {
            greetingLabel.text = "Привет!\nКак тебя зовут?"
            changePlayerButton.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "toMainVC" { return }
        
        let mainVC = segue.destination as! MainVC
        mainVC.player = player
    }
    
    @IBAction func startButtonPressed() {
        let name = nameTextField.text ?? ""
        player = Player(value: [name, 100, 0, 0, [["Мишка", "🐻", 0], ["Зайка", "🐰", 0], ["Котик", "🐱", 0], ["Собачка", "🐶", 0]]])
        try! realm.write {
            realm.add(player)
        }
        UserDefaults.standard.set(player.name, forKey: "currentPlayer")
        self.performSegue(withIdentifier: "toMainVC", sender: self)
    }
    
    @IBAction func changePlayerPressed() {
        let controller = ChangePlayerVC()
        controller.resetDelegate = self
    }
}

extension StartVC: ResetCurrentPlayer {

    func resetCurrentPlayer() {
        UserDefaults.standard.removeObject(forKey: "currentPlayer")
        print("Reset current player")
    }
}

