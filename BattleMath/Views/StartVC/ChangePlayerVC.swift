//
//  ChangePlayerVC.swift
//  BattleMath
//
//  Created by админ on 13.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit
import RealmSwift

class ChangePlayerVC: UIViewController {
    
    private var allPlayers = realm.objects(Player.self).sorted(by: { $0.power > $1.power })
    private var playerName = ""
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var createNewPlayerButton: UIButton!
    @IBOutlet var playersTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DesignSetup.BackgroundImage("sky.jpg", view: self.view)
        
        if let playerName = UserDefaults.standard.string(forKey: "currentPlayer") {
            playerNameLabel.text = "Ты не \(playerName)?"
        } else {
            playerNameLabel.text = ""
        }
    }
    
    @IBAction func createNewPlayerPressed() {
        UserDefaults.standard.removeObject(forKey: "currentPlayer")
    }
}

// MARK: - Table View DataSource and Delegate

extension ChangePlayerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = allPlayers[indexPath.row].name
        let power = allPlayers[indexPath.row].power
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = "💪🏻\(power)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = allPlayers[indexPath.row]
        UserDefaults.standard.set(player.name, forKey: "currentPlayer")
    }
    
}
