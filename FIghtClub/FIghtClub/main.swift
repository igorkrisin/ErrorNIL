//
//  main.swift
//  FightClub
//
//  Created by Игорь Крысин on 28.02.2024.
//

import Foundation


protocol ShooterDelegate {
    func isActiveSuperShoot(_ shooter: Shooter) -> Bool
    func isGameFinish(_ shooter: Shooter) -> Bool
}


protocol Shooter: AnyObject {
    var name: String { get }
    //var weapon: Weapon { get } пока убрал функционал
    var delegate : ShooterDelegate? { get set}
    var stats: Stats { get } // статистика точности выстрелов
    var shoutStrategy: ShootStrategy { get } //можно стрелять очередями или одиночными выстрелами
    var specialAbility: SpecialAbylity? { get } //стрелять с подставки, надеть прицел, стрелять лежа
    func shoot(_ target: Target)// разные по рамеру мишени
    func displayPtopertyTarget()
}


protocol SpecialAbylity {
    func shootToTarget(shooter: Shooter, to stat: Stats)
}


extension SpecialAbylity {
    func superShoot(shooter: Shooter) {
        let happyPoints = 30
        guard let isActiveSuperShoot = shooter.delegate?.isActiveSuperShoot(shooter) else { return }
        guard let isRoundFinish = shooter.delegate?.isGameFinish(shooter) else { return }
        shooter.stats.currentValue += happyPoints
        isActiveSuperShoot ? print("Вам выпал счастлывый случай и ваши очки стали + \(happyPoints)") : nil
        isRoundFinish ? print("раунд окончен вы набрали \(shooter.stats.currentValue) очков") : nil
        
    }
}


protocol ShootStrategy {
    func executeShoot(shoooter: Shooter, target: Target)
}


protocol Weapon {
    var name: TypeWeapon { get }
    var maxCountCartrifge: Int { get }
    var currentCountCartridge: Int { get }
}


enum TypeWeapon {
    case gun
    case rifle // винтовка
    case machineGun // пулемет
    case snotGun // дробовик
}


final class Stats {
    var winnerValue = 100 // cколько нужно набрать балло
    var currentValue: Int// сколько выбил
    
    var accuracy: Int { //меткость
        didSet {
            speedReactions = max(0, accuracy * 10)
        }
    }
    
    var endurance: Int {//выносливость
        didSet {
            strenght = max(1, endurance * 10)
        }
    }
    
    var speedReactions: Int {// скорость реакции
        didSet {
            if (oldValue - speedReactions) > 1 {
                accuracy += 2
            }
        }
    }
    
    var strenght: Int { // сила - чем сильнее тем проше стрелять из тяжолого оружия
        didSet {
            if (oldValue - strenght) >= 10 {
                tired = true
            } else {
                tired = false
            }
        }
    }
    
    var luckyCase: Bool {
        speedReactions == 23 ? true : false
    } // счастливый случай актривирует супер супер выстрел
    
    var tired: Bool = false
    
    
    init(accuracy: Int, endurance: Int, speedReactions: Int, strenght: Int, currentValue: Int) {
        self.accuracy = accuracy
        self.endurance = endurance
        self.speedReactions = speedReactions
        self.strenght = strenght
        self.currentValue = currentValue
    }
    
    enum valueShootToTarget {
        case exactToAplle
        case miss
        case shootToValue(_ valueOnTarget: Int)
    }
    
    func showValueOfTarget () -> valueShootToTarget {///вывод shootValue в Stats
        guard Int.random(in: 0...100) > speedReactions else { return .exactToAplle}
        return .shootToValue(currentValue)
    }
}


class Target {
    var size: Int
    var currentShootValue: Int
    
    init(size: Int, currentShootValue: Int) {
        self.size = size
        self.currentShootValue = currentShootValue
    }
}


class Gunner: ShootStrategy {
    func executeShoot(shoooter: Shooter, target: Target) {
        switch shoooter.stats.showValueOfTarget() {
        case .exactToAplle:
            print("Ваш выстрел из пистолета прямо в яблочко! и вы зарабатываете \(shoooter.stats.currentValue) очков" )
        case .miss:
            print("Вы промахнулись и заработали \(shoooter.stats.currentValue) очков ")
        case .shootToValue(let value):
            print("Вы попали по цели и заработали \(value) очков")
        }
    }
}


class MashinGunner: ShootStrategy {
    func executeShoot(shoooter: Shooter, target: Target) {
        switch shoooter.stats.showValueOfTarget() {
        case .exactToAplle:
            print("Ваш выстрел пулемета прямо в яблочко! и вы зарабатываете \(shoooter.stats.currentValue) очков" )
        case .miss:
            print("Вы промахнулись и заработали \(shoooter.stats.currentValue) очков/а ")
        case .shootToValue(let value):
            print("Вы попали по цели и заработали \(value) очков")
        }
    }
}


class SuperShoot: SpecialAbylity {
    func shootToTarget(shooter: Shooter, to stat: Stats) {
        if shooter.stats.luckyCase {
            superShoot(shooter: shooter)
        }
        
        let valueOfTarget = shooter.stats
        
        let valueBeforWinn = stat.showValueOfTarget()
        
        switch valueBeforWinn {
            
        case .exactToAplle:
            print("Попал прямо в яблочко осталось \(valueBeforWinn) до победы")
            
        case .miss:
            print("Промах по мишени у вас все так же \(valueBeforWinn) до победы")
        case .shootToValue(let newCurrentValue):
            print("Попал по мишени осталось \(valueBeforWinn) до победы")
        }
    }
}


class BaseShooter: Shooter {
    var name: String
    var delegate: ShooterDelegate?
    var stats: Stats
    var shoutStrategy: ShootStrategy
    var specialAbility: SpecialAbylity?
    
    init(name: String,
         accuracy: Int,
         endurance: Int,
         speedReactions: Int,
         strenght: Int,
         currentValue: Int,
         
         shoutStrategy: ShootStrategy,
         specialAbility: SpecialAbylity?) 
    {
        self.name = name
        self.stats = Stats(accuracy: accuracy, endurance: endurance, speedReactions: speedReactions, strenght: strenght, currentValue: currentValue)
        self.shoutStrategy = shoutStrategy
        self.specialAbility = specialAbility
    }
    
    func shoot(_ target: Target) {
        let useSpecialShoot: Bool = Int.random(in: 15...30) < self.stats.endurance
        if let abbilityShoot = self.specialAbility, useSpecialShoot {
            abbilityShoot.shootToTarget(shooter: self, to: stats) // что то тут не то...
        } else {
            shoutStrategy.executeShoot(shoooter: self, target: target)
        }
    }
    
    func displayPtopertyTarget() {
        print("""
              --------------- \(name) --------------------
              очков для победы            -> \(stats.winnerValue)
              очков выносливости          -> \(stats.endurance)
              очков скорости реакции      -> \(stats.speedReactions)
              очков меткости              -> \(stats.accuracy)
              очков силы                  -> \(stats.strenght)
              
              """)
    }
}


class Shooting: ShooterDelegate {
    var shooter: Shooter
    var target: Target
    
    
    init(shooter: Shooter, target: Target) {
        self.shooter = shooter
        self.target = target
        shooter.delegate = self
    }
    
    
    func isActiveSuperShoot(_ shooter: Shooter) -> Bool {
        return shooter.stats.luckyCase
        
    }
    
    func isGameFinish(_ shooter: Shooter) -> Bool {
        return shooter.stats.currentValue > shooter.stats.winnerValue
    }
    
    func startShootingToTarget() {
        print("shStrateg: ", shooter.shoutStrategy.executeShoot(shoooter: shooter, target: target))////////////////////////////////////////////////
        shooter.displayPtopertyTarget()
        var summaryPoints = 0
        print("что бы начать стрельбу по мишени - нажмите return")
        let _ = readLine()
        var round = 1
        
        while round < 10 || summaryPoints > shooter.stats.winnerValue {
            print("-------------- Раунд \(round) ---------------")
            shooter.shoot(target)
            if isGameFinish(shooter){
                
                print("вы  закончили игру со счетом \(summaryPoints)")
                break
            }
            if isActiveSuperShoot(shooter) {
                shooter.stats.currentValue = Int.random(in: 10...30)
                print("вам выпал счастливый случай и вы выбиваете \(shooter.stats.currentValue)")
                summaryPoints += shooter.stats.currentValue
                print("теперь у вас всего  \(summaryPoints)")
                continue
            }
            
            shooter.stats.currentValue = Int.random(in: 0...10)
            if shooter.stats.currentValue <= 0 {
                shooter.stats.currentValue = 0
                print("вы промазали по мищени")
                round += 1
                continue
            }
            summaryPoints += shooter.stats.currentValue
            round += 1
            if round >= 10 {
                print("к сожалению вы проиграли ваши очки \(summaryPoints), для победы необходимо \(shooter.stats.winnerValue)")
                print("что бы завершить игру - нажмите return")
                let _ = readLine()
                break
            }
         
            print("что бы начать следуюший раунд \(round) - нажмите return")
            let _ = readLine()
            
        }
    }
}


class ShootуrFactory {
    private let skillPoints: Int = 100
    
    func createShooter() -> BaseShooter? {
        print("введите имя стрелка: ", terminator: " ")
        guard let name = readLine(), !name.isEmpty else {
            print("не указано имя")
            return nil
        }
        print("у вас есть \(skillPoints) очков умения для распределния")
        distributionPointSkills()
        
        print("выберите тип бойца")
        print("нажми 1: \(TypeShooter.gunner)")
        print("нажми 2: \(TypeShooter.mashinGunner)")
        
        guard let strategyChoice = requestIntegerInput(prompt: "Ваш выбор 1/2: "),
              let strategy = TypeShooter(rawValue:  strategyChoice) else {
            return nil
        }
        
        let shootStrategy: ShootStrategy
        switch strategy {
        case .gunner:
            shootStrategy = Gunner()
        case .mashinGunner:
            shootStrategy = MashinGunner()
        }
        
        let strenght = requestSkillInput(prompt: "распределите очки умения для силы", maxPoint: skillPoints)
        var remainingPointSkils = skillPoints - strenght
        print("у вас осталось \(remainingPointSkils) очков для распределения")
        let speedReactions = requestSkillInput(prompt: "распределите очки умения для скорости реакции", maxPoint: skillPoints)
        remainingPointSkils -= speedReactions
        print("у вас осталось \(remainingPointSkils) очков для распределения")
        let endurance = requestSkillInput(prompt: "распределите очки умения для выносливости", maxPoint: skillPoints)
        remainingPointSkils -= endurance
        print("у вас осталось для меткости \(remainingPointSkils) очков для распределения")
        let accuracy = remainingPointSkils
        
        print("Выберите специальную способность")
        print(" 1 стрелять лежа")
        print(" 2 воспользоватся оптическим прицелом")
        print(" 3 стрелять с подставки")
        
        guard let abilityChoice = requestIntegerInput(prompt: "Ваш выбор 1/2/3: "),
              let ability = SpecialAbilityChoice(rawValue: abilityChoice) else {
            return nil
        }//дельнейший функционал не подключен
        
        var specialAbility: SpecialAbylity?
        switch ability {
        case .lieShoot :
            print("вы стреляете лежа")
        case .takeOptical:
            print("вы взяли оптику")
        case .shootingFromStand:
            print("вы стреляете с подставки")
        }
        
        return BaseShooter(name: name,
                           accuracy: accuracy,
                           endurance: endurance,
                           speedReactions: speedReactions,
                           strenght: strenght,
                           currentValue: 0,
                           shoutStrategy: shootStrategy,
                           specialAbility: specialAbility)
}
    
    private func requestSkillInput(prompt: String, maxPoint: Int) -> Int{
        print(prompt, terminator: " ")
        guard let input = readLine(),
              let value = Int(input), value <= maxPoint else {
             print("Ошибка, это не число или вы распредеяете больше очков чем у вас есть ")
            return 0
        }
        return value
    }
    
    private func requestIntegerInput(prompt: String) -> Int? {
        print(prompt)
        guard let input = readLine(), let value = Int(input) else {
            print("ошибка - это не число")
            return nil
        }
        return value
    }
    
    private func distributionPointSkills() {
        
        
    }
    
    private enum SpecialAbilityChoice: Int {
        case lieShoot = 1
        case takeOptical = 2
        case shootingFromStand = 3 // стрельба с подставки
    }
    
    private enum TypeShooter: Int {
        case gunner = 1
        case mashinGunner = 2
    }
    
    
}


final class Game {
    func startGame(_ shooting: Shooting) {
        shooting.startShootingToTarget()
    }
}




let factory = ShootуrFactory()

if let shooter:Shooter = factory.createShooter() {
    let shooting = Shooting(shooter: shooter, target: Target(size: 10, currentShootValue: 0))
    let game = Game()
    
    game.startGame(shooting)
} else {
        print("произошла ошибка при создании бойцов" )
    }




