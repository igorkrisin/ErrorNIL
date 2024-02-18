//
//  main.swift
//  HW5
//
//  Created by Игорь Крысин on 16.02.2024.
//

import Foundation



struct Sportcar {
    let brandCar: String
    let yearOfManufacture: Int
    var trunkVolume: Float
    var allFuelVolumeTank: Float
    var isEngineOn: Bool
    var isWindowsOpen: Bool
    var currentTrunkOpen: Float
    var currentFuel: Float
    
    
    //проверяю возможность некоторых действий с машиной
    
    
    enum ActionWithCar {
        
        case engineOn(Bool)
        case engineOff
        case openWindows
        case closeWindows
        case loadTrunk(Float)
        case upLoadTrunk(Float)
        case refuelCar(Float)
        
        
        
        func showToDoForCar() throws -> Float {
            
            switch self {
                
            case .engineOn(let isEngineOn):
                print("you try engine On")
                if isEngineOn{
                    return 1.0
                }
                return 0.0
            case .engineOff:
                print("you engine off")
            case .openWindows:
                print("you opened window")
            case .closeWindows:
                print("you closed window")
            case .loadTrunk(let weight):
                print("you try load trunk \(weight) kg")
                return weight
            case .upLoadTrunk(let weight):
                print("you try upload \(weight) kg")
                return weight
            case .refuelCar(let liter):
                print("you refuel \(liter) liters")
                return liter
            }
            throw fatalError()
        }
    }
    
    //проверка доступности места в багажнике
    mutating func checkAvailableTrunk(volume: Float)  {
        loadTrunk(volume: volume)
        volume <= self.trunkVolume ? print("all thing \(volume) kg load in trunk, now you have available \(currentTrunkOpen) kg ") : print("all not thing load in trunk, reminder \(self.trunkVolume - volume) kg,  now you have available \(currentTrunkOpen) kg")
    }
    
    mutating func loadTrunk(volume: Float) {
         currentTrunkOpen -= volume
    }
    
    //проверка доступности места в баке
    mutating func checkAvailableVolumeRefuel(for fuel: Float)  {
        let remainsVolumeInTank = allFuelVolumeTank - currentFuel
        refuelTank(fuel: fuel)
        fuel <= remainsVolumeInTank ? print("all fuel \(fuel) liter refuel in tank, now you have \(currentFuel) liter ") : print("all not fuel refuel in tunk, reminder \(fuel - remainsVolumeInTank ) liter, now you have \(currentFuel) liter ")
    }
    
    mutating func refuelTank(fuel: Float) {
        currentFuel += fuel
    }
    
    //проверка доступности бензина при запуске
    func checkAvailableForStartEnginel() {
        if self.allFuelVolumeTank > 0 {
            print("reminder fuel: \(currentFuel) you try access start engine")
        }
        else{
            print("reminder fuel: \(currentFuel) you failed  start engine")
        }
    }
    
    
    //сообщение, сколько стало места после выгрузки
    mutating func checkUploadTrunk(weight: Float) {
        let availableVolume =  availableVolumeInTrunk(weight: weight)
        print("now available \(availableVolume) kg in trunk")
    }
    
    
    mutating func availableVolumeInTrunk(weight: Float) -> Float {
        let currentWeightInTrunk = currentTrunkOpen + weight
        
        if currentWeightInTrunk <= trunkVolume {
            return currentWeightInTrunk
        }
        return trunkVolume
    }
}



var ferrari: Sportcar = Sportcar(brandCar: "ferrari", yearOfManufacture: 2023, trunkVolume: 300, allFuelVolumeTank: 60, isEngineOn: true, isWindowsOpen: true, currentTrunkOpen: 200, currentFuel: 0)

let tryLoadTrunk = try Sportcar.ActionWithCar.loadTrunk(200).showToDoForCar()
var loadTrunkResult: () = ferrari.checkAvailableTrunk(volume: tryLoadTrunk)
print("\n")
let tryRefuel = try Sportcar.ActionWithCar.refuelCar(30).showToDoForCar()
let refuelTrunkResult: () = ferrari.checkAvailableVolumeRefuel(for: tryRefuel)
print("\n")
let tryStartEngine = try Sportcar.ActionWithCar.engineOn(true).showToDoForCar()
let startEngineResult: () = ferrari.checkAvailableForStartEnginel()
print("\n")
let tryUploadTrunk = try Sportcar.ActionWithCar.upLoadTrunk(350).showToDoForCar()
let uploadTrunkResult: () = ferrari.checkUploadTrunk(weight: tryUploadTrunk)



struct Truck {
    let brandCar: String
    let yearOfManufacture: Int
    let bodyVolume: Float
    var isEngineOn: Bool
    var isWindowsOpen: Bool
    var currentBodyOpen: Float
    var heightTruck: Float
    var weightTruck: Float
    var countPassangers: Float
    
    enum ActionWithTruk {
        case goToUnderBridge(Float)
        case gotoWeightControl(Float)
        case seatPassenger(Float)
        
        func showActionForTruck() throws -> Float{
            switch self {
            case .goToUnderBridge(let height):
                print("you try go to under bridge with height \(height) meters")
                return height
            case .gotoWeightControl(let weight):
                print("you try go to under weight control with weight \(weight) t")
                return weight
            case .seatPassenger(let countPassangers):
                print("you try take \(countPassangers) persons")
                return countPassangers
            }
            throw fatalError("that action don't available")
        }
    }
    //проверка проедет ли под мостом грузовик
    func checkGoToUnderBridge(bridge height: Float) {
        if height > heightTruck {
            print("you acces go to under bridge")
        } else {
            print("you cant go to under Birdge, because height yor truck \(heightTruck), but birdge height \(height)")
        }
    }
    //проверка проедет ли весовой констроль грузовик
    func checkGoToWeightControl(controlWeight: Float) {
        if weightTruck < controlWeight {
            print("you acces go to weight control")
        } else {
            print("you can't go to weight control, because weight yor truck \(weightTruck) t, but max weight on weight control \(controlWeight) t")
        }
    }
    // проверка сядут ли все пассажиры в грузовик
    func сheckCountOfPassangers(countPerson: Float) {
        if countPerson < countPassangers {
            print("you acces take passanger")
        } else {
            print("you can't take passnger, available seat \(countPassangers) person, you try take \(countPerson) person")
        }
    }
}

var truck: Truck = Truck(brandCar: "Kamaz", yearOfManufacture: 2020, bodyVolume: 10, isEngineOn: true, isWindowsOpen: false, currentBodyOpen: 10, heightTruck: 2.8, weightTruck: 5, countPassangers: 2)
print("\n")
let tryGoToUnderBirdge = try Truck.ActionWithTruk.goToUnderBridge(2.6).showActionForTruck()
let tryGoToUnderBirdgeResult: () = truck.checkGoToUnderBridge(bridge: tryGoToUnderBirdge)
print("\n")
let tryGoToWeightControl = try Truck.ActionWithTruk.gotoWeightControl(3).showActionForTruck()
let goToWeightControlResult: () = truck.checkGoToWeightControl(controlWeight: tryGoToWeightControl)
print("\n")
let tryTakePassangers = try Truck.ActionWithTruk.seatPassenger(3).showActionForTruck()
let seatPassangerResult: () = truck.сheckCountOfPassangers(countPerson: tryTakePassangers)




//Задание 1: Описание структур SportCar и TrunkCar
//Описание: Создайте две структуры, представляющие разные типы автомобилей: спортивный автомобиль и грузовик.
//Требования:
//Каждая структура должна включать следующие свойства: марку авто, год выпуска, объем багажника/кузова, состояние двигателя (запущен/остановлен), состояние окон (открыты/закрыты), текущий объем багажника.
//Подсказки:
//Рассмотрите использование Bool для свойств состояния двигателя и окон.
//
//Ожидаемый результат:
//Две структуры с требуемыми свойствами и их типами данных.


//Задание 2: Создание перечисления действий с автомобилем
//Описание: Определите перечисление, которое содержит различные действия, которые могут быть предприняты с автомобилем.
//Требования:
//Включите следующие действия: запустить/остановить двигатель, открыть/закрыть окна, погрузить/выгрузить груз определенного объема.
//Подсказки:
//Учитывайте, что действия по загрузке/выгрузке должны учитывать доступный объем багажника/кузова.
//
//Ожидаемый результат:
//Перечисление, в котором содержатся все необходимые действия с автомобилем.

//Задание 3: Добавление метода для изменения свойств автомобиля
//Описание: В каждую структуру добавьте метод, который принимает один аргумент типа перечисления и изменяет свойства структуры в соответствии с действием.
//Требования:
//Метод должен корректно обрабатывать каждое действие из перечисления.
//Убедитесь, что метод обновляет свойства структуры соответствующим образом.
//Подсказки:
//Внимательно обработайте ситуации, когда действие невозможно выполнить из-за текущего состояния объекта (например, погрузка груза превышает доступный объем).
//
//Ожидаемый результат:
//Метод в каждой структуре, который принимает действие в виде перечисления и модифицирует свойства структуры соответствующим образом.
//Метод может выводить результат действия в консоль (например, "Двигатель запущен" или "Недостаточно места в багажнике").
//
////----------------------------------------------------------------------------------------------------------
//
//Задание 4: Инициализация и использование структур
//Описание: Инициализируйте несколько экземпляров каждой структуры и выполните различные действия с ними, используя метод из предыдущего задания.
//Требования:
//Создайте различные объекты каждой структуры и примените к ним различные действия из перечисления.
//Подсказки:
//Обратите внимание на то, как изменяется состояние объекта после каждого действия и проверьте его, выводя свойства объекта в консоль.
//
//Ожидаемый результат:
//Код, который создает несколько экземпляров каждой структуры и вызывает их методы, передавая различные действия из перечисления.
////----------------------------------------------------------------------------------------------------------
//
//Задание 5: Вывод свойств объектов
//Описание: Выведите в консоль свойства каждого созданного объекта.
//Требования:
//После выполнения действий над объектами, выведите актуальные данные об их свойствах.
//Подсказки:
//Можете использовать функцию print в Swift для вывода данных в консоль.
//
//Ожидаемый результат:
//Код, который создает несколько экземпляров каждой структуры и вызывает их методы, передавая различные действия из перечисления.
//*/
//
