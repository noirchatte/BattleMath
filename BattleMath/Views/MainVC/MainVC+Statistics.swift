//
//  MainVC+Statistics+Extension.swift
//  BattleMath
//
//  Created by админ on 30.06.2019.
//  Copyright © 2019 AnnaKosss. All rights reserved.
//

import UIKit

// MARK: Statistics View

extension MainVC {
    
    func setupStatistics() {
        var statistics = "\(player.name), вот твоя статистика:\n"
        statistics += "\nВсего решено примеров: \(player.totalExamples)\n"
        statistics += "Из них решено верно: \(player.solvedExamples)\n"
        let percentage = Double(player.solvedExamples) / Double(player.totalExamples) * 100
        statistics += "(Это \(String(format: "%.1f", percentage))% от общего количества.)\n"
        statistics += "Побеждено боссов: \(player.bossDefeatedTimes)\n"
        statistics += "В твоей коллекции \(player.heroes.count) героев."
        statisticsLabel.text = statistics
    }
}
