//
//  main.swift
//  Vechical
//
//  Created by Игорь Крысин on 05.03.2024.
//

import Foundation



import Foundation

enum Models {
    case BMW
    case Mersedes
}
enum LoadUnloadCapable: CustomStringConvertible {
    case load
    case unload
    
    var description: String {
        switch self {
        case .load:
            return "загрузить"
        case .unload:
            return "выгрузить"
        }
    }
}

enum ActionWithCar {
    case startEnigine
    case stopEnigine
    case startMooving
    case stopMooving
    case loadUnload(_ : LoadUnloadCapable, volume: Float)
    case openDoors
    case closeDoors
    case openTrunk
    case closeTrunk
    case startRace
    //    case openWindows
    //    case closeWindows
    
}

protocol Vehicle {
    var carBrand: Models { get set }
    var year: String { get set }
    var volumeTrunk: Float { get }
    var сurrentVolume: Float { get set }
    var startEnigine: Bool { get set }
    var stopEnigine: Bool { get set }
    var startMooving: Bool { get set }
    var stopMooving: Bool { get set }
    var openDoors: Bool { get set }
    var closeDoors: Bool { get set }
    var openTrunk: Bool { get set }
    var closeTrunk: Bool { get set }
    var hoursePower: Int { get set }
}
//гонка
protocol Race {
    func isRase() -> Bool
    func createRace(myCar: Vehicle)
    
}

protocol VehicleAction {
    var successMessage: String { get set }
    var failureMessage: String { get set }
    
    mutating func canPerform(vehicle: Vehicle) -> Bool
    func performAction(on vehicle: inout Vehicle)
}

extension VehicleAction {
    mutating func perform(vehicle: inout Vehicle) {
        if canPerform(vehicle: vehicle) {
            performAction(on: &vehicle)
            print(successMessage)
        } else {
            print(failureMessage)
        }
    }
}

protocol VehicleActionParameters {
    var successMessage: String { get set }
    var failureMessage: String { get set }
    mutating func canPerform(on vehicle: Vehicle, action: LoadUnloadCapable, volume: Float) -> Bool
    mutating func performAction(on vehicle: inout Vehicle, action: LoadUnloadCapable, volume: Float)
}
extension VehicleActionParameters {
    mutating func perform(on vehicle: inout Vehicle, action: LoadUnloadCapable, volume: Float) {
        if canPerform(on: vehicle, action: action, volume: volume) {
            performAction(on: &vehicle, action: action, volume: volume)
            print(successMessage)
        } else {
            print(failureMessage)
        }
    }
}

struct StartRace: Race {
    var successMessage: String = "Гонка началась"
    var failureMessage: String = "Гонка не соссотялась"
  
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.closeTrunk = true
        vehicle.openTrunk = false
    }

    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.openDoors else {
            failureMessage = "нельзя устраивать гонку с открытой дверью"
            return false
        }
        guard !vehicle.openTrunk else {
            failureMessage = "нельзя устраивать гонку с открытым багажником"
            return false
        }
        return true
    }
    
    func isRase() -> Bool {
        print("Вы хотите начать гонку? 1 - да 2 - нет")
        guard let answer = readLine(), answer == "1" || answer == "2" else {
            print("Вы ввели неверные данные, гонка отменена")
            return false
        }
        if answer == "2" {
            print("Гонка отменена")
        }
        
       return true
        
    }
    
    func createRace(myCar: Vehicle) {
        var opponent: Vehicle = Car(hoursePower: Int.random(in: 100...300), carBrand: Models.BMW, year: "2024", volumeTrunk: 70)
        if myCar.hoursePower < opponent.hoursePower {
            print("Вы проиграли соперник был сильнее у него \(opponent.hoursePower) лошадинных cил ")
        } else {
            print("Вы выиграли соперник был слабее у него \(opponent.hoursePower) лошадинных cил ")
        }
        
    }
    
    
}

struct StartMoovingAction: VehicleAction {
    var successMessage: String = "Автомобиль тронулся"
    var failureMessage: String = "Автомобиль уже в движении"
    
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.openDoors else {
            failureMessage = "Прежде чем тронуться, закройте все двери"
            return false
        }
        guard !vehicle.openTrunk else {
            failureMessage = "Прежде чем тронуться, закройте багажник"
            return false
        }
        if !vehicle.startEnigine {
            failureMessage = "Необходимо сначала завести автомобиль"
            return false
        }
        guard !vehicle.startMooving else {
            return false
        }
        
        return !vehicle.startMooving
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.startMooving = true
    }
}

struct StopMoovingAction: VehicleAction {
    var successMessage: String = "Автомобиль остановился"
    var failureMessage: String = "Автомобиль и так стоит на месте"
    
    func canPerform(vehicle: Vehicle) -> Bool {
        return !vehicle.stopMooving
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.stopMooving = true
        vehicle.startMooving = false
    }
}

struct StartEnigineAction: VehicleAction {
    var successMessage: String = "Автомобиль завелся"
    var failureMessage: String = "Автомобиль был ранее заведен"
    
    func canPerform(vehicle: Vehicle) -> Bool {
        return !vehicle.startEnigine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.startEnigine = true
        vehicle.stopEnigine = false
    }
}

struct StopEnigineAction: VehicleAction {
    var successMessage: String = "Мотор заглушен"
    var failureMessage: String = "Мотор ранее уже был залушен"
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        if vehicle.startMooving {
            failureMessage = "Прежде чем загулшить мотор, притормозите где ни будь"
            return false
        }
        return !vehicle.stopEnigine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.stopEnigine = true
        vehicle.startEnigine = false
    }
}

struct OpenDoorAction: VehicleAction {
    var successMessage: String = "Вы открыли двери автомобиля"
    var failureMessage: String = ""
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.startMooving else {
            failureMessage = "Нельзя открыть двери на ходу, чтобы открыть двери, притормозите где-нибдь"
            return false
        }
        guard !vehicle.openDoors else {
            failureMessage = "Нельзя открыть двери, так как они уже открыты"
            return false
        }
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.openDoors = true
        vehicle.closeDoors = false
    }
}

struct CloseDoorAction: VehicleAction {
    var successMessage: String = "Вы закрыли двери автомобиля"
    var failureMessage: String = "Нельзя закрыть двери, так как они уже закрыты"
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.closeDoors else {
            return false
        }
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.closeDoors = true
        vehicle.openDoors = false
    }
}

struct OpenTrunkAction: VehicleAction {
    var successMessage: String = "Вы открыли багажник"
    var failureMessage: String = ""
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.openTrunk else {
            failureMessage = "Нельзя открыть багажник, так как багажник уже открыт"
            return false
        }
        guard !vehicle.startMooving else {
            failureMessage = "Нельзя открыть багажник на ходу, чтобы открыть багажник, притормозите где-нибдь"
            return false
        }
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.openTrunk = true
        vehicle.closeTrunk = false
    }
}

struct CloseTrunkAction: VehicleAction {
    var successMessage: String = "Вы закрыли багажник автомобиля"
    var failureMessage: String = "Нельзя закрыть багажник, так как багажник уже закрыт"
    
    mutating func canPerform(vehicle: Vehicle) -> Bool {
        guard !vehicle.closeTrunk else {
            return false
        }
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.closeTrunk = true
        vehicle.openTrunk = false
    }
}

struct LoadUnloadAction: VehicleActionParameters {
    
    var successMessage: String = ""
    var failureMessage: String = ""
    
    mutating func canPerform(on vehicle: Vehicle, action: LoadUnloadCapable, volume: Float) -> Bool {
        guard !vehicle.startMooving else {
            failureMessage = "Автомобиль в движении, сначала остановитесь где ни будь"
            return false
        }
        guard vehicle.openTrunk else {
            failureMessage = "Чтобы \(action) в багаж, сначала откройте багажник"
            return false
        }
        
        switch action {
        case .load:
            if vehicle.сurrentVolume + volume > vehicle.volumeTrunk {
                let spaceInTrunk = vehicle.volumeTrunk - vehicle.сurrentVolume
                failureMessage = "В багажнике нет столько места, вы можете загрузить только \(spaceInTrunk) л."
                return false
            }
            let residue = vehicle.volumeTrunk - (vehicle.сurrentVolume + volume)
            successMessage = "Груз объемом \(volume) л успешно загружен! В багажнике осталось \(residue) л свободного места."
        case .unload:
            if volume > vehicle.сurrentVolume {
                failureMessage = "Невозможно выгрузить столько, вы можете выгрузить лишь \(vehicle.сurrentVolume) л."
                return false
            }
            let residue = vehicle.сurrentVolume - volume
            successMessage = "Груз объемом \(volume) л успешно выгружен! В багажнике осталось \(residue) л свободного места."
        }
        return true
    }
    
    mutating func performAction(on vehicle: inout Vehicle, action: LoadUnloadCapable, volume: Float) {
        switch action {
        case .load:
            vehicle.сurrentVolume += volume
        case .unload:
            vehicle.сurrentVolume -= volume
        }
    }
}

struct VehicleActionHandler {
    func performAction(_ action: ActionWithCar, vehicle: inout Vehicle) {
        switch action {
        case .startMooving:
            var startVoogingAction = StartMoovingAction()
            startVoogingAction.perform(vehicle: &vehicle)
        case .stopMooving:
            var stopMoogingAction = StopMoovingAction()
            stopMoogingAction.perform(vehicle: &vehicle)
        case .startEnigine:
            var startEnigineAction = StartEnigineAction()
            startEnigineAction.perform(vehicle: &vehicle)
        case .stopEnigine:
            var stopEnigineAction = StopEnigineAction()
            stopEnigineAction.perform(vehicle: &vehicle)
        case .loadUnload(let action, let volume):
            var loadUnloadAction = LoadUnloadAction()
            loadUnloadAction.perform(on: &vehicle, action: action, volume: volume)
        case .openDoors:
            var openDoorsAction = OpenDoorAction()
            openDoorsAction.perform(vehicle: &vehicle)
        case .closeDoors:
            var closeDoorsAction = CloseDoorAction()
            closeDoorsAction.perform(vehicle: &vehicle)
        case .openTrunk:
            var openTrunkAction = OpenTrunkAction()
            openTrunkAction.perform(vehicle: &vehicle)
        case .closeTrunk:
            var closeTrunkAction = CloseTrunkAction()
            closeTrunkAction.perform(vehicle: &vehicle)
        case .startRace:
            var startRase = StartRace()
            if startRase.isRase() {//если игрок хочет - можно устроить гонку
                startRase.createRace(myCar: vehicle)
            }
            startRase.performAction(on: &vehicle)
            
        }
    }
}

struct Car: Vehicle {
    var hoursePower: Int
    
    
    var carBrand: Models
    var year: String
    
    var volumeTrunk: Float
    var сurrentVolume: Float = 0
    
    var startEnigine: Bool = false
    var stopEnigine: Bool = true
    var startMooving: Bool = false
    var stopMooving: Bool = false
    var openDoors: Bool = false
    var closeDoors: Bool = true
    var openTrunk: Bool = false
    var closeTrunk: Bool = true
}

var car: Vehicle = Car(hoursePower: 200, carBrand: .Mersedes, year: "2024", volumeTrunk: 100)


VehicleActionHandler().performAction(.openTrunk, vehicle: &car)
VehicleActionHandler().performAction(.loadUnload(.load, volume: 60), vehicle: &car)
VehicleActionHandler().performAction(.loadUnload(.load, volume: 100), vehicle: &car)
VehicleActionHandler().performAction(.loadUnload(.unload, volume: 40), vehicle: &car)
VehicleActionHandler().performAction(.loadUnload(.unload, volume: 1), vehicle: &car)
VehicleActionHandler().performAction(.loadUnload(.unload, volume: 60), vehicle: &car)
VehicleActionHandler().performAction(.openDoors, vehicle: &car)
VehicleActionHandler().performAction(.startEnigine, vehicle: &car)
VehicleActionHandler().performAction(.closeDoors, vehicle: &car)
VehicleActionHandler().performAction(.startMooving, vehicle: &car)
VehicleActionHandler().performAction(.startRace, vehicle: &car)






