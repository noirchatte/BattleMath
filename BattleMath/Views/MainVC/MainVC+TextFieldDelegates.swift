//
//  MainVC+TextFieldDelegates.swift
//  BattleMath
//
//  Created by админ on 03.07.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: TextField Delegate

extension MainVC: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getAnswer()
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    // Adding "Done" button
    
    func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Ответить",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
