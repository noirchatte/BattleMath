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

    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = player.name
        print(player.name)

    }
    
}
