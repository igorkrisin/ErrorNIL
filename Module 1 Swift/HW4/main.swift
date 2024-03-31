//1 -  Задание: Времена года и их температура
// Описание: Создайте приложение, которое отображает среднюю температуру для различных времен года.
// Требования:
// Перечисление "Времена года»: Создайте перечисление Season с четырьмя вариантами: Winter, Spring, Summer и Fall.
// Средняя температура: Каждому времени года должна соответствовать средняя температура. Используйте свойство вычисляемого типа (computed property) для этой цели.
// Вывод температуры: Реализуйте функцию, которая выводит среднюю температуру для выбранного времени года.
// Ожидаемый результат: При запуске приложения можно получить среднюю температуру для любого из четырех времен года.

import Foundation


enum Season {
    case winter
    case spring
    case summer
    case fall
    
    var arrangeTemperSpring: Int {
        let maxTemp = 15
        let minTemp = -5
        return (maxTemp + minTemp)/2
    }
    var arrangeTemperSummer: Int {
        let maxTemp = 10
        let minTemp = 30
        return (maxTemp + minTemp)/2
    }
    var arrangeTemperFall: Int {
        let maxTemp = 20
        let minTemp = -5
        return (maxTemp + minTemp)/2
    }
    
    var arrangeTemperWinter: Int {
        let maxTemp = 0
        let minTemp = -30
        return (maxTemp + minTemp)/2
    }
    
    func arrangeTemper(season: Season) -> Int {
        print("arrange tempearature \(season): ")
        switch season {
        case .fall:
            return arrangeTemperFall
        case .winter:
            return arrangeTemperWinter
        case .spring:
            return arrangeTemperSpring
        case .summer:
            return arrangeTemperSummer
        }
    }
}

var season = Season.fall

//print(season.arrangeTemper(season: .fall))
//print(season.arrangeTemper(season: .spring))
//print(season.arrangeTemper(season: .summer))
//print(season.arrangeTemper(season: .winter))


//2 -  Задание: Информация о транспортных средствах
//Описание: Создайте приложение, которое предоставляет информацию о различных видах транспортных средств, таких как их максимальная скорость.
//Требования:
//Перечисление "Транспорт":  Создайте перечисление Transport с различными типами транспортных средств, такими как автомобиль, велосипед, поезд и самолет.
//Максимальная скорость: Для каждого транспортного средства укажите его максимальную скорость. Используйте ассоциативные значения для этой цели.
//Вывод информации: Реализуйте функцию, которая выводит максимальную скорость для выбранного транспортного средства.
//Ожидаемый результат: Пользователь может узнать максимальную скорость любого из указанных транспортных средств.
//Написать функцию которая вычислит транспорт с самым максимальным значением

enum Transport: Int {
    case bycile = 30
    case car = 350
    case airplane = 1500
    case trian = 250
    
    func maxSpeedForTransport() -> Int {
        print("max speed eatch transport \(self): ", terminator: " ")
        switch self {
        case .bycile:
            return transport.rawValue
        case .car:
            return transport.rawValue
        case .airplane:
            return transport.rawValue
        case .trian:
            return transport.rawValue
        }
    }
    func theFastestTransport(transports: Transport) -> Int {
        var maxSpeed = 0
        var transportSpeed = transports.rawValue
        print("max speed for transport: \(transport) - ", terminator: " ")
        switch transport {
        case .bycile:
            if transport.rawValue > maxSpeed{
                maxSpeed = transportSpeed
            }
        case .car:
            if transport.rawValue > maxSpeed{
                maxSpeed = transportSpeed
            }
        case .airplane:
            if transport.rawValue > maxSpeed{
                maxSpeed = transportSpeed
            }
        case .trian:
            if transport.rawValue > maxSpeed{
                maxSpeed = transportSpeed
            }
        }
        return maxSpeed
    }

}


let transport = Transport.airplane
//
//print(transport.maxSpeedForTransport()) // я уже написал по первой версии, ты поправил условия я дописал продолжение
//
//print(transport.theFastestTransport(transports: .bycile))

//3 -  Задание: Статусы платежей
//Описание: Создайте систему учета статусов платежей, которая позволяет отслеживать различные этапы обработки платежа.
//Требования:
//Перечисление "Статус платежа»: Создайте перечисление PaymentStatus со статусами: Неоплачено, В обработке, Оплачено, Ошибка.
//Дополнительная информация: Некоторые статусы требуют дополнительной информации. Например, для оплаченного статуса нужна дата оплаты, а для статуса ошибки - сообщение об ошибке. Используйте ассоциативные значения для сохранения этой информации.
//Вывод информации: Реализуйте функционал, который позволяет пользователю узнать дату оплаты для определенного платежа или причину ошибки.
//Ожидаемый результат: Пользователь может узнать детали каждого платежа в зависимости от его статуса.


enum PayStatus {
    case notPay
    case paymentProcessing
    case payDone(String)
    case error(String)
    
    func getStatusPay() {
        switch self {
        case .notPay:
            print("платеж не произведен")
        case .paymentProcessing:
            print("Ваш платеж находится в обработке")
        case .payDone(let date):
            print("платеж выполнеен \(date)")
        case .error(_):
            print("извините произошла ошибка")
        }
    }
}


var pay = PayStatus.payDone("15.01.2023")
    //pay.getStatusPay()

//4 -  Задание: Рекомендации по режимам камеры
//Описание: Создайте систему, которая дает рекомендации по использованию различных режимов камеры.
//Требования:
//Перечисление "Режим камеры»: Создайте перечисление CameraMode с режимами: Авто, Портрет, Ландшафт, Ночной.
//Рекомендации: Для каждого режима предоставьте рекомендацию, когда и как лучше его использовать.
//Получение рекомендации: Реализуйте функционал, который позволяет пользователю получить рекомендацию для выбранного режима камеры.
//Ожидаемый результат: При выборе определенного режима камеры пользователь получает рекомендацию по его использованию.


enum СameraMode {
    case auto
    case portrait
    case ladscape
    case night
    
    func descriptionMode() {
        switch self {
        case .auto:
            print("данный режим сам подберет необходимые настрйоки")
        case .portrait:
            print("фотографируйте с расстояния не более 3м")
        case .ladscape:
            print("держите линию горизонта выше центра экрана")
        case .night:
            print("используйте вспышку или искуственное освещение")
        }
    }
    
}

var choiseMode = СameraMode.portrait
//choiseMode.descriptionMode()

//5 - Задание: Диеты животных в зоопарке
//Описание: Создайте информационную систему о типах животных в зоопарке и их предпочтениях в пище.
//Требования:
//Перечисление "Тип животного»: Создайте перечисление AnimalType с типами: Хищник, Травоядное, Насекомое.
//Диета: Укажите, что ест каждый тип животного.
//Получение информации о диете: Реализуйте функционал, который позволяет узнать, что ест определенное животное.
//Ожидаемый результат:  Пользователь может узнать, что ест определенное животное в зоопарке.

enum AnimalsDiet {
    case predator
    case herbivore
    case insect
    
    
    func getDietAnimals() {
        print( " \(self) diet: ")
        switch self {
        case .predator:
            print("мясо, рыба")
        case .herbivore:
            print("трава, листья")
        case .insect:
            print("кровь, фекалии")
        }
        
    }
    
}

var animalDiet = AnimalsDiet.herbivore
//animalDiet.getDietAnimals()


//6 - Задание: Отслеживание статуса заказа в ресторане
//Описание: Разработайте систему, которая позволяет отслеживать статус приготовления заказа в ресторане.
//Требования:
//Перечисление "Статус заказа»: Создайте перечисление OrderStatus со статусами: Принят, Готовится, Готов к подаче, Доставляется.
//Следующий статус: Реализуйте функционал, который показывает, какой статус будет следующим после текущего.
//Получение следующего статуса: Пользователь может узнать, какой статус будет следующим для его заказа.
//Ожидаемый результат: Пользователь может отслеживать, на каком этапе находится его заказ.

enum OrderState {
    case accept
    case prepare
    case done
    case delivery
    
    func showNextStatusToOrder() {
        print("now yor status order is  \(self) next status: ")
        switch self {
        case .accept:
            print("prepare")
        case .prepare:
            print("done")
        case .done:
            print("delivery")
        case .delivery:
            print("your order is finished")
        }
    }
    
}

let order = OrderState.delivery

//order.showNextStatusToOrder()


//7 - Задание: Информация о номерах в отеле
//Описание: Создайте систему, которая предоставляет информацию о различных типах номеров в отеле.
//Требования:
//Перечисление "Тип комнаты»: Создайте перечисление RoomType с типами номеров: Одноместный, Двухместный, Люкс.
//Информация о комнате: Для каждого типа комнаты укажите его стоимость и количество доступных номеров.
//Получение информации о комнате: Пользователь может узнать стоимость и количество доступных номеров для выбранного типа комнаты.
//Ожидаемый результат: Пользователь может узнать детали о различных типах номеров в отеле.

enum HotelRooms {
    case single(Int, Int)
    case double(Int, Int)
    case luxe(Int, Int)
    
    func getRoomsDescription() {
        switch self {
        case .single(let price, let count):
            print("price single room \(price), remainders rooms \(count)")
        case .double(let price, let count):
            print("price double room \(price), remainders rooms \(count)")
        case .luxe(let price, let count):
            print("price lux room \(price), remainders rooms \(count)")
        }
    }
}

var roomSingle = HotelRooms.single(100, 20)
var roomDouble = HotelRooms.double(200, 10)
var roomLuxe = HotelRooms.luxe(600, 3)

//roomSingle.getRoomsDescription()
//roomDouble.getRoomsDescription()
//roomLuxe.getRoomsDescription()

//8 - Задание: Уровни сложности в игре
//Описание: Разработайте систему, которая позволяет определить параметры игры на основе выбранного уровня сложности.
//Требования:
//Перечисление "Уровень сложности»: Создайте перечисление DifficultyLevel с уровнями: Легкий, Средний, Тяжелый, Эксперт.
//Параметры игры: Укажите количество врагов и временные ограничения для каждого уровня сложности.
//Получение параметров: Реализуйте функционал, который позволяет пользователю узнать параметры игры для выбранного уровня сложности.
//Ожидаемый результат: Пользователь может узнать, сколько врагов и какое временное ограничение установлено для выбранного уровня сложности.


enum DifficultLevel {
    case easy(Int, Int)
    case medium(Int, Int)
    case hard(Int, Int)
    case expert(Int, Int)
    
    func showDescriptionInfoLEvel() {
        switch self {
        case .easy(let enemy, let time):
            print("so you have \(enemy) enemy, \(time) seconds")
        case .medium(let enemy, let time):
            print("so you have \(enemy) enemy, \(time) seconds")
        case .hard(let enemy, let time):
            print("so you have \(enemy) enemy, \(time) seconds")
        case .expert(let enemy, let time):
            print("so you have \(enemy) enemy, \(time) seconds")
        }
    }
}

let easyLevel = DifficultLevel.easy(10, 300)
let mediumLevel = DifficultLevel.medium(20, 250)
let hardLevel = DifficultLevel.hard(30, 200)
let expertLevel = DifficultLevel.expert(50, 100)

//easyLevel.showDescriptionInfoLEvel()
//mediumLevel.showDescriptionInfoLEvel()
//hardLevel.showDescriptionInfoLEvel()
//expertLevel.showDescriptionInfoLEvel()


//9 - Задание: Прогноз погоды по облачности
//Описание: Создайте систему, которая предоставляет информацию о вероятности осадков на основе уровня облачности.
//Требования:
//Перечисление "Облачность»: Создайте перечисление Cloudiness с уровнями: Ясно, Частичная облачность, Облачно, Пасмурно.
//Вероятность осадков: Укажите вероятность осадков для каждого уровня облачности.
//Получение прогноза: Реализуйте функционал, который позволяет пользователю узнать вероятность осадков для выбранного уровня облачности.
//Ожидаемый результат: Пользователь может узнать вероятность осадков, основываясь на текущем уровне облачности.


enum Cloudiness {
    case clear
    case partlyCloudly
    case cloudly
    case isRain
    
    func showPobabilityOfPrecipitation() {
        print("on outside in sky is \(self), probability of precipitation: ")
        switch self {
            
        case .clear:
            print(0)
        case .partlyCloudly:
            print(20)
        case .cloudly:
            print(50)
        case .isRain:
            print(100)
        }
    }
}

let clearOnTheSky = Cloudiness.clear
let partlyCloudlyOnTheSky = Cloudiness.partlyCloudly
let cloudlyCloudlyOnTheSky = Cloudiness.cloudly
let isRainCloudlyOnTheSky = Cloudiness.isRain


//clearOnTheSky.showPobabilityOfPrecipitation()
//partlyCloudlyOnTheSky.showPobabilityOfPrecipitation()


//10 - Задание: Цены напитков в автомате
//Описание: Создайте систему, которая предоставляет информацию о стоимости различных напитков, доступных в автомате.
//Требования:
//Перечисление "Тип напитка»: Создайте перечисление DrinkType с напитками: Кофе, Чай, Горячий шоколад, Вода.
//Стоимость напитка: Укажите стоимость каждого напитка.
//Получение цены: Реализуйте функционал, который позволяет пользователю узнать стоимость выбранного напитка.
//Ожидаемый результат: Пользователь может узнать стоимость напитка перед тем, как совершить покупку в автомате.
//

enum drinkType {
    case coffee
    case tea
    case hotChocolate
    case water
    
    func showDrinkPrice() {
        print("you choise \(self), it price:", terminator: " ")
        switch self {
            
        case .coffee:
            print(200)
        case .tea:
            print(100)
        case .hotChocolate:
            print(250)
        case .water:
            print(80)
        }
    }
    
}


let cofee = drinkType.coffee
let tea = drinkType.tea
let hotChocolate = drinkType.hotChocolate
let water = drinkType.water

//cofee.showDrinkPrice()
//tea.showDrinkPrice()
//hotChocolate.showDrinkPrice()
//water.showDrinkPrice()


//11. Создайте перечисление (enum), представляющее различные типы документов, где каждый тип документа ассоциируется с уникальным строковым идентификатором в качестве его rawValue. В вашем перечислении должны быть следующие типы документов: паспорт, водительское удостоверение, идентификационная карта.
//
//Реализуйте в этом перечислении метод, который возвращает описание типа документа. Например, для паспорта метод может вернуть "Документ, удостоверяющий личность и гражданство".
//
//После этого напишите код, который создает экземпляр этого перечисления с использованием rawValue, и выводит описание документа.


enum TypeDocumets: String {
    case passport = "1234 554777"
    case driverLicence = "4444 3433"
    case id = "122123234345"
    
    func descriptionDocument() {
        switch self {
            
        case .passport:
            print("Документ, удостоверяющий личность и гражданство")
        case .driverLicence:
            print("Документ удостоверяюший право на управление автомобилем")
        case .id:
            print("Документ присваивающий id")
        }
    }
}

let passport = TypeDocumets.passport

print("\(passport) с номером  \(passport.rawValue)", terminator: " ")
passport.descriptionDocument()












//protocol ArrangeTemperatur {
//    func calculate(max: Int, min: Int) -> Int
//}
//
//enum Seaso: ArrangeTemperatur {
//    case winter
//    case spring
//    case summer
//    case fall
//    
//    func calculate(max: Int, min: Int) -> Int {
//        return (max + min) / 2
//    }
//    
//    func arrangeTemper() -> Int {
//        print("arrange tempearature \(self): ")
//        switch self {
//        case .fall:
//            return calculate(max: 15, min: -5)
//        case .winter:
//            return calculate(max: 10, min: 30)
//        case .spring:
//            return calculate(max: 20, min: -5)
//        case .summer:
//            return calculate(max: 0, min: -30)
//        }
//    }
//}
//
//let fall = Seaso.fall
//let winter = Seaso.winter
//let spring = Seaso.spring
//let summer = Seaso.summer
//
//print(fall.arrangeTemper())
//print(spring.arrangeTemper())
//print(summer.arrangeTemper())
//print(winter.arrangeTemper())
