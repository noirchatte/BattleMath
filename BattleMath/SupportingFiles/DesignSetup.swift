//
//  DesignSetup.swift
//  BattleMath
//
//  Created by админ on 22.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

struct DesignSetup {
    
    static func BackgroundImage(_ imageTitle: String, view: UIView) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageTitle)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    static let hardnessText = ["Тебе подойдет этот уровень сложности, если ты только начинаешь свои первые шаги в математике.",
                                "Если ты уже знаешь все цифры и можешь, считать до десяти, попробуй этот уровень сложности!",
                                "Этот уровень сложности подходит тем ребятам, которые уже уверенно себя чувствуют в устном счете."]
}

// MARK: - Rounding all buttons corners

extension UIButton {
    override open var bounds: CGRect {
        didSet {
            let radius = self.bounds.height / 2
            self.layer.cornerRadius = radius
        }
    }
}

