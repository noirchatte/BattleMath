//
//  MainVC+Alert.swift
//  BattleMath
//
//  Created by админ on 02.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Alert Controller

extension MainVC {
    
    func showAlert(title: String? = nil, message: String, cancelButtonNeeded: Bool = false, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if completion != nil { completion!() }
        }
        
        if cancelButtonNeeded {
            let cancelAction = UIAlertAction(title: "Нет", style: .default)
            alert.addAction(cancelAction)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
