//
//  BaseShooter.swift
//  Shooter
//
//  Created by Игорь Крысин on 05.03.2024.
//

import Foundation

class BaseShooter: Shooter {
   
    var name: String
    
    var stat: Stats
    
    var weapon: Weapon
    
    var currentValue: Int {
        shoot()
    }
    
    
    init(name: String, stat: Stats, weapon: Weapon) {
        self.name = name
        self.stat = stat
        self.weapon = weapon
    }
    
    
    func shoot() -> Int {
        if stat.accurency == 1.5 {
            return Int(Double.random(in: 0...10) * 1.5)
        }
        if stat.accurency == 1.3 {
            return Int(Double.random(in: 0...10) * 1.3)
        }
        return Int.random(in: 0...10)
       
    }
    
    func showStats() {
        let ability = Ability.self
        print("\(String(describing: ability.accuracy))\n\(String(describing: ability.endurance))\n")
        print("ваше оружие \(weapon)")
    }
}
