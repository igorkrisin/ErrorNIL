//
//  Shooting.swift
//  Shooter
//
//  Created by Игорь Крысин on 05.03.2024.
//

import Foundation

class Shooting {
    var shooter: Shooter
    
    init(shooter: Shooter) {
        self.shooter = shooter
    }
    
    func isGameFinish() -> Bool {
        let winnerPoints = shooter.stat.winnerValue
        let currentPoints = shooter.currentValue
        return winnerPoints <= currentPoints
    }
    
    func startShootingToTarget() {
        shooter.showStats()
        var summaryPoints = 0
        
        var round = 1
        
        while round < 10 {
            print("currentValue: ", shooter.currentValue)
            print("-------------- Раунд \(round) ---------------")
            if isGameFinish(){
                
                print("вы  закончили игру со счетом \(summaryPoints)")
                break
            }
            if shooter.currentValue <= 0 {
                print("вы промазали по мишени")
                round += 1
                print("что бы начать стрельбу по мишени - нажмите return")
                let _ = readLine()
                continue
            }
            summaryPoints += shooter.currentValue
            round += 1
            if round >= 10 {
                print("к сожалению вы проиграли ваши очки \(summaryPoints), для победы необходимо \(shooter.stat.winnerValue)")
                print("что бы завершить игру - нажмите return")
                let _ = readLine()
                break
            }
            print("Вы выбилипопали в мишень")
            print("теперь у вас всего  \(summaryPoints)")
            print("что бы начать следуюший раунд \(round) - нажмите return")
            let _ = readLine()
            
        }
    }
    
}
