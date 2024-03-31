"""
1. Домашнее задание к 9 и 10-му уроку: Работа с иерархией животных и управление циклом удержания

Описание:

Ваша задача - создать иерархию классов для представления животных. Каждое животное должно соответствовать протоколу Animal, который определяет общие характеристики и функционал для всех животных. В этой задаче вы также познакомитесь с использованием дженериков, ограничений протоколов и управлением циклом удержания.

Шаг 1: Создание протокола Animal

Создайте протокол Animal, который определяет общие характеристики и функционал для всех животных. Этот протокол должен содержать свойство name и метод makeSound(), который будет реализован в классах-наследниках.

Шаг 2: Создание классов Dog и Cat

Создайте классы Dog и Cat как конкретные типы животных. Каждый класс должен соответствовать протоколу Animal. Реализуйте в этих классах необходимые свойства и методы, такие как имя и звук, издаваемый животным.

Шаг 3: Функция makeSound

Создайте функцию makeSound, которая принимает любое животное, соответствующее протоколу Animal, и вызывает метод makeSound этого животного. Обратите внимание на использование дженериков и ограничений протоколов для обеспечения полиморфного поведения функции.

Шаг 4: Управление циклом удержания

Создайте класс RetainCycleExample, который использует слабые ссылки (weak) для предотвращения возможного цикла удержания. Внутри этого класса создайте экземпляры Dog и Cat, и сохраните их слабые ссылки. Это гарантирует корректное освобождение памяти при удалении RetainCycleExample.

Важно:

После завершения всех шагов убедитесь, что ваш код компилируется без ошибок и демонстрирует ожидаемое поведение. Проверьте, что функция makeSound вызывает правильные методы для каждого типа животного, и что класс RetainCycleExample правильно освобождает память после удаления.
"""


import Foundation

protocol Animal {
    var animalType: String { get }
    var animalColor: String { get }
    
    func makeSound()
}

class Cat: Animal {
    
    var animalType: String
    var animalColor: String
    
    init(animalType: String, animalColor: String) {
        self.animalType = animalType
        self.animalColor = animalColor
    }
    
    deinit {
        print("deinit cat")
    }
    
    func makeSound() {
        print("meow")
    }
}


class Dog: Animal {
    
    var animalType: String
    var animalColor: String
    
    init(animalType: String, animalColor: String) {
        print("создан")
        self.animalType = animalType
        self.animalColor = animalColor
    }
    
    deinit {
        print("deinit dog")
    }
    func makeSound() {
        print("bark")
    }
}


func makeSound<T: Animal>(_ animal: T) {
    animal.makeSound()
}

class RetainCycleExample {
     weak var dog: Dog?
     weak var cat : Cat?
    
    init(dog: Dog, cat: Cat) {
        self.dog = dog
        self.cat = cat
    }
    
}

var dog: Dog? = Dog(animalType: "PitBul", animalColor: "white")
var cat: Cat?  = Cat(animalType: "Angorskaya", animalColor: "Black")

var animal = RetainCycleExample(dog: dog!, cat: cat!)

animal.cat?.makeSound()

animal.dog?.makeSound()

dog = nil
cat = nil

"""
2. Домашнее задание по использованию дженериков и протоколов: Создание универсального кэша данных

Описание:

В этом задании вам предстоит создать универсальный кэш данных, который будет позволять сохранять данные различных типов в соответствии с их ключами. Кэш данных должен быть реализован в виде структуры, использующей дженерики и протоколы.

Шаг 1: Создание класса Animal

Сначала создайте класс Animal, который будет представлять общий класс для всех животных. Убедитесь, что класс Animal реализует протокол Hashable, чтобы его можно было использовать в качестве ключа в кэше. Класс Animal должен иметь свойство name для хранения имени животного.

Шаг 2: Создание подклассов Dog и Cat

Создайте подклассы Dog и Cat, которые будут наследоваться от класса Animal. В этих классах можно добавить любые дополнительные свойства или методы, необходимые для описания конкретных типов животных.

Шаг 3: Создание протокола Cacheable

Создайте протокол Cacheable, который будет определять общие методы для кэша данных. Этот протокол должен иметь ассоциированные типы для ключа (Key) и значения (Value), а также методы для добавления, получения и удаления элементов из кэша.

Шаг 4: Создание универсальной структуры Cache

Создайте структуру Cache, которая реализует протокол Cacheable. Внутри этой структуры используйте словарь для хранения данных, где ключом будет тип ключа (Key), а значением - тип значения (Value). Обратите внимание, что в качестве ключей могут быть использованы только объекты типа Animal.

Шаг 5: Тестирование

Создайте экземпляр кэша данных и протестируйте его, выполнив операции добавления, получения и удаления данных по различным типам ключей и значений.

Важно:

Убедитесь, что ваш кэш данных правильно обрабатывает различные типы ключей и значений, а также корректно выполняет операции добавления, получения и удаления данных. Проверьте работу метода contains для подтверждения наличия или отсутствия значения в кэше.

"""

class Animal2: Hashable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
       }
       
    
    static func == (lhs: Animal2, rhs: Animal2) -> Bool {
        return lhs.name == rhs.name
    }
}

class Dog2: Animal2 {
    let color: String
    
    init(color: String, name: String) {
        self.color = color
        super.init(name: name)
    }
}


class Cat2: Animal2 {
    let color: String
    
    init(color: String, name: String) {
        self.color = color
        super.init(name: name)
    }
}

protocol Cacheable {
    associatedtype Key
    associatedtype Value
    
    //Methods for works with cash
    mutating func addValue(_ value: Value, forKey key: Key)
    mutating func getValue(for key: Key) -> Value?
    mutating func removeValue(forKey key: Key)
}

struct Cash: Cacheable {

    typealias Key = Animal2
    typealias Value = String
    
    var store: [Key:Value] = [Key: Value]()
    
    mutating func addValue(_ value: Value, forKey key: Key) {
        store[key] =  value
    }
    
    mutating func getValue(for key: Key) -> Value? {
        guard let keyAnimal = store[key] else { return nil }
        return keyAnimal
    }
    
    mutating func removeValue(forKey key: Key) {
        store.removeValue(forKey: key)
    }
    
    func showCash() {
        var cashForPrint: [String] = []
        for value in store.keys {
            cashForPrint.append(value.name)
        }
        print(cashForPrint)
    }
}




"""
3. Домашнее задание по расширению структуры Cache с использованием subscript из предыдущего задания

Описание:

В этом задании вы будете расширять структуру Cache, добавляя к ней возможность доступа к данным с помощью subscript. Subscript позволит упростить доступ к данным в кэше, делая код более читаемым и лаконичным.

Шаг 1: Добавление subscript для получения данных

Добавьте subscript для структуры Cache, который позволит получать значение из кэша по ключу. Subscript должен принимать параметр типа Key (тип ключа кэша) и возвращать соответствующее значение из кэша (тип Value).

Шаг 2: Добавление subscript для установки данных

Добавьте subscript для структуры Cache, который позволит устанавливать значение в кэш по ключу. Subscript должен принимать параметры типа Key (тип ключа кэша) и Value (тип значения) и устанавливать соответствующее значение в кэш.

Шаг 3: Тестирование

Создайте экземпляр кэша данных и протестируйте его, используя subscript для получения и установки данных. Убедитесь, что добавленные subscript работают корректно и возвращают ожидаемые результаты.
"""

extension Cash {
    
    subscript(key: Animal2) -> Value? {
            guard let value = store[key] else { return nil }
            return value
       
    }

    
    subscript(value: Value, forKey key: Key) ->  Value? {
        
        get {
            guard let value = store[key] else { return nil }
            return value
        }
        set {
            store[key] = newValue
        }
    }
}




let cat2: Animal2 = Cat2(color: "White", name: "murka")
let dog2: Animal2 = Dog2(color: "black", name: "PesSmerdyachiy")

var cash: Cash = Cash()

cash.addValue(cat2.name, forKey: cat2)
cash.addValue(dog2.name, forKey: dog2)

print("get: ", cash.getValue(for: dog2) as Any )

cash.showCash()

cash.removeValue(forKey: cat2)

cash.showCash()
cash[cat2.name, forKey: dog2] = "Sharikc"
cash.showCash()

let value = cash[dog2]
print("value: ", value!)


"""
3. В этом задании вы будете работать с замыканиями в Swift и изучите их синтаксис и применение.

Шаг 1: Создание замыканий

Создайте замыкание sumClosure, которое принимает два параметра типа Int и возвращает их сумму. Замыкание должно быть написано в форме синтаксиса, где типы параметров и возвращаемого значения указаны явно.

Создайте замыкание multiplicationClosure, которое принимает два параметра типа Int и возвращает их произведение. Здесь используйте более краткий синтаксис, без явного указания типов параметров и возвращаемого значения.

Создайте замыкание subtractionClosure, которое принимает два параметра типа Int и возвращает результат вычитания второго параметра из первого. Используйте синтаксис замыкания с использованием аргументов $0 и $1.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
"""

let summClosure =  { (num1: Int, num2: Int) -> Int  in
    num1+num2
}
print(summClosure(5, 4))

let summClosure2: (Int, Int) -> Int = { $0 + $1 }

print(summClosure2(4, 9))

let multiplicateClosure = {$0 * $1} (5, 4)
print(multiplicateClosure)


let subtractionClosure = {$0 - $1} (5, 4)
print(subtractionClosure)

"""
Шаг 2: Использование замыканий

Создайте переменную increment с помощью функции makeIncrementer, которая принимает один параметр - значение, на которое нужно увеличить число.

Вызовите созданное замыкание increment с аргументом 7 и сохраните результат в переменную result.

Выведите значение переменной result на консоль.
"""

func makeIncrementer(num: Int) -> ((Int) -> Int) {
    return { number in
        return num + number
    }
}

var increment = makeIncrementer(num: 7)


let result = increment(8)
print(result)


"""
Шаг 3: Дополнительные задания (необязательные)

Используя замыкание, создайте переменную addClosure, которая принимает пять параметров типа Double и Int и возвращает их сумму.

Реализуйте возможность использования замыкания addClosure с разным количеством аргументов, начиная с двух. При передаче меньшего количества аргументов, они должны заполняться нулями.
"""

var addClosure = { (num1: Int, num2: Int, num3: Double, num4: Double, num5: Double) -> Double in
    return Double(num1) + Double(num2) + num3 + num4 + num5
    
}

print(addClosure(5, 5, 10, 10, 10))



let myClosure2: ([Double]) -> Double = { numbers in
    if numbers.count < 2 {
        return 0
    }
    var summ: Double = 0
    var countOfArguments = 0
    for number in numbers {
        summ += number
        countOfArguments += 1
        if countOfArguments >= 5 {
            break
        }
        
    }
    
    return summ
    
}

print(myClosure2([1,2,3]))

print(myClosure2([4.0]))

print(myClosure2([1.0,2.0,3, 4, 5,6]))


let myClosure3: ([Double]) -> Double = { numbers in
    if numbers.count < 2 {
        return 0
    }
    let summArray = numbers.reduce(0, +)
    
    return summArray
    
}

print(myClosure3([1.0,2.0,3, 4, 5,6]))


"""
4. Задание: Создание структуры "Смартфон" с использованием Swift
Цель:
Научиться создавать структуры с использованием вычисляемых свойств, наблюдателей свойств, инициализаторов, методов и расширений в Swift.

Описание:
В этом задании вы будете создавать структуру, представляющую собой смартфон. Структура будет содержать функционал для управления уровнем заряда батареи, включения и выключения устройства, а также для предоставления информации о состоянии батареи.




Задачи:
Создайте структуру Smartphone с необходимыми свойствами и функционалом.
Проверьте правильность работы вашей структуры, используя функцию startProgramm.
Изучите, как работают наблюдатели свойств, методы и расширения в контексте вашей структуры.
Дополнительное задание:
Добавьте дополнительные функции или свойства в вашу структуру Smartphone, которые могли бы быть полезными для управления устройством или получения информации о нем.
"""







"""
Шаги:
Определение структуры Smartphone:

Создайте структуру Smartphone, содержащую приватные свойства batteryPercentage (уровень заряда батареи) и maxBatteryPercentage (максимальный уровень заряда).
Определите вычисляемое свойство batteryLevel, которое представляет текущий уровень заряда батареи в виде строки с символом %.
Создайте свойство isPoweredOn с наблюдателями, которое отслеживает состояние включения/выключения устройства.
Опишите инициализаторы для установки начальных значений батареи и состояния устройства.
"""

struct Smarthphone {
    
    var storeState: [String: String] = [:]
    
    private var batteryPercentage:  Int
    private var maxBattaryPersentage: Int = 100
    private var isPhoneOn: Bool = true
    
    var battaryLevel: String {
        "battary level: \(batteryPercentage) %"
    }
    
    var isPoweredOn: Bool {
        didSet {
            if isPhoneOn {
                print("Smartphome is ON")
            } else {
                print("Smartphome is OFF")
            }
           
        }
    }
    
    init?(batteryPercentage: Int,  isPoweredOn: Bool) {
        self.batteryPercentage = min(max(batteryPercentage, 0), maxBattaryPersentage)
        self.isPoweredOn = isPoweredOn
    }
    
    
    init?(description: String) {
        let words = description.components(separatedBy: " ")
        
        if words.count != 2 {
            fatalError("not enought arguments for init description")
        }
        
        let battaryPercentage =  NSString(string: words[0]).integerValue
        
        if words[1] != "on" && words[1] != "off" {
            return nil
        }
        
        func isPhoneOn() -> Bool {
            return words[1] == "on"
        }
        
        self.init(batteryPercentage: battaryPercentage, isPoweredOn: isPhoneOn())
        add(key: "battery", value: "\(battaryPercentage) %")
        add(key: "power", value: words[1])
        
    }
//    Методы и расширения:
//
//    Создайте методы chargeBattery и useBattery для управления уровнем заряда батареи.
//    Определите метод batteryStatus, который возвращает строку с описанием текущего состояния батареи.
//    Создайте расширение для типа String, которое добавляет свойство batteryStatus, позволяющее выводить описание состояния батареи прямо из строки.

    mutating func chargeBattery(percentage: Int) {
        batteryPercentage += percentage
        print("BATTARY CHARGED: ", batteryPercentage)
        if !isPersentLess100lMore0() {
            batteryPercentage = maxBattaryPersentage
        }
        print(" battary is chargering now, there are \(batteryPercentage) %")
    
        
    }
    
    mutating func useBattery(percentage: Int) {
        batteryPercentage -= percentage
        if !isPersentLess100lMore0() {
            batteryPercentage = 0
        }
        print(" battary is using now, there are \(batteryPercentage) %")
    }
    
    mutating func batteryStatus() -> String {
        switch batteryPercentage {
        case 0..<30: return "lower battary"
        case 30..<60: return "normal battary"
        default:
            return "great battary"
        }
    }
    
    func isPersentLess100lMore0() -> Bool {
        return  batteryPercentage < maxBattaryPersentage || batteryPercentage > 0
    }
    
}

extension String {
    var batteryStatus: String {
        return self
    }
}

extension Smarthphone {
    subscript(key: String) -> String {
        get {
            return storeState[key] ?? "null! "
        }
        set {
            storeState[key] = newValue
            switch newValue {
            case "on": isPoweredOn = true
            case "off": isPoweredOn = false
            default: fatalError("не существующая команда")
            }
        }
    }
    
    mutating func add(key: String, value: String) {
        storeState[key] = value
    }
    
    func get(key: String) -> String? {
        guard let value = storeState[key] else { return nil}
        return value
    }
}









"""
Пример использования:

В функции startProgramm создайте экземпляр структуры Smartphone, используя инициализатор из строки с описанием уровня заряда и состояния питания.
Выведите информацию о уровне заряда, состоянии питания и состоянии батареи с помощью вышеописанных свойств и методов.
Пример:
func startProgramm() {
    // Пример использования
    guard let newPhone = Smartphone(description: "33% on") else { return }

    print(newPhone.batteryLevel.batteryStatus) // выводит: 70%
    print(newPhone.isPoweredOn)  // выводит: true
    print(newPhone["battery"]!)   // выводит: 70%
    print(newPhone["power"]!)     // выводит: on

    print(newPhone.batteryStatus()) // выводит: Хороший уровень заряда
}


startProgramm()
"""

func startProgramm() {
    // Пример использования
    guard var phone = Smarthphone(description: "70% on") else { return }

    print(phone.battaryLevel.batteryStatus) // выводит: 70%
    print(phone.isPoweredOn)  // выводит: true
    print(phone["battery"])   // выводит: 70%
    print(phone["power"])     // выводит: on

    print(phone.batteryStatus()) // выводит: Хороший уровень заряда
    
    phone.chargeBattery(percentage: 20)
    print(phone.battaryLevel) // выводит: 90%
    print(phone.isPoweredOn)  // выводит: true
    print(phone["battery"])   // выводит: 90%
    print(phone["power"])     // выводит: on
    phone["power"] = "off"    // newPhone.isPoweredOn = false
    print(phone.isPoweredOn)  // выводит: false
    print(phone["power"])     // выводит: off
    print(phone.batteryStatus()) // great battary
}

startProgramm()




























