//
//  main.swift
//  Shooter
//
//  Created by Игорь Крысин on 04.03.2024.
//

protocol Shooter: AnyObject {
    var name: String { get }
    var stat: Stats { get }
    var weapon: Weapon { get }
    func shoot() -> Int
    func showStats()
    var currentValue: Int { get }
}

enum Ability {
    case accuracy(Int) //меткость
    case endurance(Int) // выносливость
   
}


let factory = FactoryShooter()

if let shooter: Shooter = factory.createShooter() {
    let shooting = Shooting(shooter: shooter)
    let game = Game()
    
    game.startGame(shooting)
} else {
    print("произошла ошибка при создании стрелка")
}

