import Foundation

enum ModelsCar {
    case Tesla
    case Volva
    case BMW
    case Mersedes
}

enum Exception {
    case onExepiton, noExeption
}

enum ActionsWithCar {
    case moving
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadUnloadCar(volume: Float)
}

protocol Vehicle {
    var carBrand: ModelsCar { get }
    var year: String { get }
    var trunkOrBodyVolume: Float { get }
    var currentTrunkVolume: Float { get set }
    var isStartedEngine: Bool { get set }
    var isStopedEnigine: Bool { get set }
    var isOpenWindow: Bool { get set }
    var isCloseWindow: Bool { get set }
    var isMoving: Bool { get set }
    
    mutating func performAction(_ action: ActionsWithCar)
}

protocol VehicleAction {
    var successMessage: String { get }
    var failureMessage: String { get }
    func canPerform(on vehicle: Vehicle) -> Bool
    func performAction(on vehicle: inout Vehicle)
}

protocol VehicleActionWithParameter {
    var successMessage: String { get }
    var failureMessage: String { get }
    mutating func canPerform(on vehicle: Vehicle) -> Bool
    mutating func performAction(on vehicle: inout Vehicle, volume: Float)
}

extension VehicleAction {
    func perform(on vehicle: inout Vehicle) {
        if canPerform(on: vehicle) {
            performAction(on: &vehicle)
        } else {
            print(failureMessage)
        }
    }
}

struct VehicleActionHandler {
    func performAction(_ action: ActionsWithCar, on vehicle: inout Vehicle) {
        switch action {
        case .startEngine:
            StartEngineAction().perform(on: &vehicle)
        case .stopEngine:
            StopEngineAction().perform(on: &vehicle)
        case .openWindows:
            OpenWindowsAction().perform(on: &vehicle)
        case .closeWindows:
            CloseWindowsAction().perform(on: &vehicle)
        case .loadUnloadCar(let volume):
            var loadUnloadAction = LoadUnloadCarAction()
            loadUnloadAction.performAction(on: &vehicle, volume: volume)
        case .moving:
            MovingActions().perform(on: &vehicle)
        }
    }
}

struct MovingActions: VehicleAction {
    var successMessage: String = "Машина тронулась"
    var failureMessage: String = "Мы уже в движении"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        if !vehicle.isStartedEngine {
            print("Сначала нужно завести машину")
        } else if vehicle.isMoving {
            print(failureMessage)
        } else {
            vehicle.isMoving = true
            print(successMessage)
        }
    }
}

struct StartEngineAction: VehicleAction {
    var successMessage: String = "Завел двигатель"
    var failureMessage: String = "Двигатель уже заведен"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        return !vehicle.isStartedEngine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStartedEngine = true
        vehicle.isStopedEnigine = false
        print(successMessage)
    }
}

struct StopEngineAction: VehicleAction {
    var successMessage: String = "Заглушил двигатель"
    var failureMessage: String = "Двигатель уже был заглушен"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isStopedEnigine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStopedEnigine = true
        vehicle.isStartedEngine = false
        vehicle.isMoving = false
        print(successMessage)
    }
}

struct OpenWindowsAction: VehicleAction {
    var successMessage: String = "Открыл окна"
    var failureMessage: String = "Окна уже были открыты"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isOpenWindow
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isOpenWindow = true
        vehicle.isCloseWindow = false
        print(successMessage)
    }
}

struct CloseWindowsAction: VehicleAction {
    
    var successMessage: String = "Закрыл двери"
    var failureMessage: String = "Двери уже были закрыты"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isCloseWindow
    }
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isCloseWindow = true
        vehicle.isOpenWindow = false
        print(successMessage)
    }
}

struct SportCar: Vehicle {
    
    var isMoving: Bool = false
    
    let carBrand: ModelsCar
    let year: String
    let trunkOrBodyVolume: Float
    var currentTrunkVolume: Float = 0
    var isStartedEngine: Bool = false
    var isStopedEnigine: Bool = false
    var isOpenWindow: Bool = false
    var isCloseWindow: Bool = false
    
    mutating func performAction(_ action: ActionsWithCar) {}
}

struct LoadUnloadCarAction: VehicleActionWithParameter {
    var successMessage = "Операция загрузки/выгрузки прошла успешна"
    var failureMessage = String()
    
    mutating func canPerform(on vehicle: Vehicle) -> Bool {
        if vehicle.isMoving {
            failureMessage = "Операция невозможна: автомобиль находится в движении"
            return false
        }
        return true
    }
    
    mutating func canPerform(on vehicle: Vehicle, volume: Float) -> Bool {
        if volume > 0 {
            if vehicle.currentTrunkVolume + volume > vehicle.trunkOrBodyVolume {
                failureMessage = "Превышен допустимый объем багажника"
                return false
            }
        } else if volume < 0 {
            let unloadVolume = abs(volume)
            if vehicle.currentTrunkVolume < unloadVolume {
                failureMessage = "Невозможно выгрузить больше, чем загружено"
                return false
            }
        } else {
            failureMessage = "Объем для загрузки/выгрузки не указан"
            return false
        }
        return true
    }
    
    mutating func performAction(on vehicle: inout Vehicle, volume: Float) {
        if canPerform(on: vehicle, volume: volume) {
            if volume > 0 {
                vehicle.currentTrunkVolume += volume
                print("Загружено \(volume) л. Объем груза: \(vehicle.currentTrunkVolume) л.")
            } else {
                let unloadVolume = abs(volume)
                vehicle.currentTrunkVolume -= unloadVolume
                print("Выгружено \(unloadVolume) л. Текущий объем груза: \(vehicle.currentTrunkVolume) л.")
            }
        } else {
            print(failureMessage)
        }
    }
}

func startGame(car: inout Vehicle, vehicleHandler: VehicleActionHandler) {
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.stopEngine, on: &car) //Заглушил двигатель
    vehicleHandler.performAction(.openWindows, on: &car) //Открыл окна
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.moving, on: &car) //Машина тронулась
    vehicleHandler.performAction(.moving, on: &car) //Мы уже в движении
    vehicleHandler.performAction(.stopEngine, on: &car) //Заглушил двигатель
    vehicleHandler.performAction(.moving, on: &car) // Сначала нужно завести машину
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.moving, on: &car) // Машина тронулась
    
}

var mySportCar: Vehicle = SportCar(carBrand: .Tesla, year: "2021", trunkOrBodyVolume: 500)
startGame(car: &mySportCar, vehicleHandler: .init())
