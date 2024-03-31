struct FactoryShooter {
    
    func createShooter() -> BaseShooter? {
        let maxSkillPoints = 100
        
        print("введите имя стрелка")
        guard let name = readLine(), !name.isEmpty else {
            print( "имя не указано" )
            return nil
            
        }
        
        //let ability = Ability.self
        
        let accuracyPoints = promptSkill(prompot: "распределите очки умения для меткости", point: maxSkillPoints)
        let remainingPointSkillFirEndurence = maxSkillPoints - accuracyPoints
      
        print("у вас \(remainingPointSkillFirEndurence) очков для выносливости")
        
       
        print("выберите оружие 1 - пистолет 2 - автомат")
        guard let weapon = readLine(), weapon == "1" || weapon == "2" else {
            print("такого оружия нет")
            return nil
        }
        
        //проверям сколько очков задал пользователь, если высокие. то применяем увеличивающий коэффициент
        var statAccurencyLevel: Stats
        if accuracyPoints >= 80 {
            statAccurencyLevel = Stats(accurency: 1.5, endurance: 0.7)  // отличная точность
        } else if accuracyPoints >= 50 {
            statAccurencyLevel = Stats(accurency: 1.3, endurance: 0.9)   // средняя точность
        } else  {
            statAccurencyLevel = Stats(accurency: 1.0, endurance: 1.0)
        }
        
        
        
        
        
        //создаем стредка из пистолета или стрелка из пулемета
        switch weapon {
        case "1":
            return BaseShooter(name: name, stat: statAccurencyLevel, weapon: Weapon.gun)
        default:
            return BaseShooter(name: name, stat: statAccurencyLevel, weapon: Weapon.machinagun)
        }
        
        
  
    }
    //присваиваем очки
    private func promptSkill (prompot: String, point: Int) -> Int {
        print(prompot, terminator: " ")
        guard let input = readLine(),
            let value = Int(input), value <= point else {
                print("Ошибка, это не число или вы распредеяете больше очков чем у вас есть ")
            return 0
            }
        return value
    }
    
   
    
}
