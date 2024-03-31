//
//  main.swift
//  HW 6,7
//
//  Created by Игорь Крысин on 24.02.2024.
//

import Foundation
//
//enum ActionWithCar {
//    
//    case engineOn(Bool)
//    case engineOff
//    case openWindows
//    case closeWindows
//    case loadTrunk(Float)
//    case upLoadTrunk(Float)
//    case refuelCar(Float)
//}
//
//class Car {
//    var mark: String
//    var type: String
//    var model: String
//    var yearOfManufacture: Int
//    var manufacturer: String
//    var powerEngine: Int
//    var isWheelsSpinning: Bool
//    
//    
//    init(mark: String, type: String, manufacturer: String, powerEngine: Int, model: String, yearOfManufacture: Int, isWheelsSpinning: Bool) {
//        self.mark = mark
//        self.type = type
//        self.manufacturer = manufacturer
//        self.powerEngine = powerEngine
//        self.model = model
//        self.yearOfManufacture = yearOfManufacture
//        self.isWheelsSpinning = isWheelsSpinning
//    }
//    
//    func isCarGoTo () -> Bool {
//        return isWheelsSpinning
//    }
//    
//    func actions(action: ActionWithCar) {
//        
//        switch action {
//        case .closeWindows:
//            print("Окно закрыто")
//        
//        case .engineOn(_):
//            print("двигатель заведен")
//        case .engineOff:
//            print("двигатель заглшен")
//        case .openWindows:
//            print("Окно открыто")
//        case .loadTrunk(_):
//            print("автомобиль загружен")
//        case .upLoadTrunk(_):
//            print("автомобиль разгружен")
//        case .refuelCar(_):
//            print("авто заправлено")
//        }
//    }
//    
//}
//
//class TruckCar: Car {
//    var liftingCapacity: Float
//    var volumeOfBody: Float
//    
//    init(mark: String, liftingCapacity: Float, volumeOfBody: Float, type: String, manufacturer: String, powerEngine: Int, model: String, yearOfManufacture: Int, isWheelsSpinning: Bool) {
//        self.liftingCapacity = liftingCapacity
//        self.volumeOfBody = volumeOfBody
//        super.init(mark: mark,type: type, manufacturer: manufacturer, powerEngine: powerEngine, model: model, yearOfManufacture: yearOfManufacture, isWheelsSpinning: isWheelsSpinning)
//    }
//    
//    override func actions(action: ActionWithCar) {
//        switch action {
//        case .closeWindows:
//            print("Окно закрыто")
//        
//        case .engineOn(_):
//            print("двигатель заведен")
//        case .engineOff:
//            print("двигатель заглшен")
//        case .openWindows:
//            print("Окно открыто")
//        case .loadTrunk(_):
//            print("багажник загружен")
//        case .upLoadTrunk(_):
//            print("багажник разгружен")
//        case .refuelCar(_):
//            print("авто заправлено")
//        }
//    }
//    
//}
//
//
//class SportCar: Car {
//    var maxSpeed: Float
//    var timeAcceleration: Float
//    
//    init(mark: String, maxSpeed: Float, timeAcceleration: Float, type: String, manufacturer: String, powerEngine: Int, model: String, yearOfManufacture: Int
//         , isWheelsSpinning: Bool) {
//        self.maxSpeed = maxSpeed
//        self.timeAcceleration = timeAcceleration
//        super.init(mark: mark, type: type, manufacturer: manufacturer, powerEngine: powerEngine, model: model, yearOfManufacture: yearOfManufacture, isWheelsSpinning: isWheelsSpinning)
//    }
//    
//    override func actions(action: ActionWithCar) {
//            switch action {
//            case .closeWindows:
//                print("Окно закрыто")
//            
//            case .engineOn(_):
//                print("двигатель заведен")
//            case .engineOff:
//                print("двигатель заглшен")
//            case .openWindows:
//                print("Окно открыто")
//            case .loadTrunk(_):
//                print("Кузов загружен")
//            case .upLoadTrunk(_):
//                print("багажник разгружен")
//            case .refuelCar(_):
//                print("Кузов загружен")
//            }
//        }
//}
//
//let ferarri: SportCar = SportCar(mark: "ferrari", maxSpeed: 300, timeAcceleration: 3.3, type: "sport", manufacturer: "Ferari", powerEngine: 500, model: "aventador", yearOfManufacture: 2015, isWheelsSpinning: true)
//
//let kamaz: TruckCar = TruckCar(mark: "kamaz", liftingCapacity: 120, volumeOfBody: 1500, type: "truck", manufacturer: "Kamaz", powerEngine: 1500, model: "5205", yearOfManufacture: 2012, isWheelsSpinning: false)
//
//print("марка: ", ferarri.mark,  "максимальная скорость: ", ferarri.maxSpeed, "разгон до 100 км/ч: ", ferarri.timeAcceleration, "тип авто: ", ferarri.type, "мощность двигателя: ", ferarri.powerEngine, "модель: ", ferarri.model, "год выпуска: ", ferarri.yearOfManufacture, "в движении: ", ferarri.isWheelsSpinning  )
//
//print("марка: ", kamaz.mark, "грузоподьемность: ", kamaz.liftingCapacity, "вместимость кузова: ", kamaz.volumeOfBody, "тип авто: ", kamaz.type, "мощность двигателя: ", kamaz.powerEngine, "модель: ", kamaz.model, "год выпуска: ", kamaz.yearOfManufacture, "в движении: ", kamaz.isWheelsSpinning  )


protocol Vechicle {
    
    func displayIdentity() -> String
    
}

class Car: Vechicle {
    var make: String
    var model: String
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
    func displayIdentity() -> String {
        return "make car: \(make), model car:  \(model)"
    }
}

class TruckCar: Car {
    var cargoCapacity: String
    
    init(cargoCapacity: String, make: String, model: String) {
        self.cargoCapacity = cargoCapacity
        super.init(make: make, model: model)
    }
    
    override func displayIdentity() -> String {
        return super.displayIdentity() + "cargo capacity: \(cargoCapacity) "
    }
}


class SportCar: Car {
    var maxSpeed: String
    
    init(maxSpeed: String, make: String, model: String) {
        self.maxSpeed = maxSpeed
        super.init(make: make, model: model)
    }
    override func displayIdentity() -> String {
        return super.displayIdentity() + "max speed \(maxSpeed) " 
    }
}

var truck = TruckCar(cargoCapacity: "20t", make: "kamaz", model: "5202")
var sportCar = SportCar(maxSpeed: "300", make: "ferarri", model: "aventador")//вроде как авентодор - это ламборджини)) у меня новый ferrari

var arrayVechical: [Vechicle] = [truck, sportCar]

for car in arrayVechical {
    print(car.displayIdentity())
}





























