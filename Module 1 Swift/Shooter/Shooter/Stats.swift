//
//  Stats.swift
//  Shooter
//
//  Created by Игорь Крысин on 05.03.2024.
//

import Foundation
class Stats {
    
    var  winnerValue: Int = 100
    
    var currentValue: Int {
        return Int.random(in: 0...10)
    }
    
    var accurency: Float//меткость
    var endurance: Float//выносливость
    
    init(accurency: Float, endurance: Float) {
        self.accurency = accurency
        self.endurance = endurance
    }
    
    
    
   
    
    
    
}
