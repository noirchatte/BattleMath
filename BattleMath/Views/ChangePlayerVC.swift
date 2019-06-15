//
//  ChangePlayerVC.swift
//  BattleMath
//
//  Created by админ on 13.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit
import RealmSwift

protocol ResetCurrentPlayer {
    func resetCurrentPlayer()
}

class ChangePlayerVC: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    private var allPlayers = realm.objects(Player.self)
    var resetDelegate: ResetCurrentPlayer?
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var createNewPlayerButton: UIButton!
    @IBOutlet var playersTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            playerNameLabel.text = "Ты не \(playerName)?"
        } else {
            playerNameLabel.text = ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = allPlayers[indexPath.row].name
        return cell
    }

    @IBAction func createNewPlayerPressed() {
        resetDelegate?.resetCurrentPlayer()
        self.performSegue(withIdentifier: "createNewPlayer", sender: self)
    }
}
