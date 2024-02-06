import Foundation

//1. Создайте переменные для стоимости кофе, чая и пирожного.
//   Затем вычислите общую стоимость заказа, умножив количество каждого товара на его цену и сложив результаты.
//   После этого примените скидку 10%, вычтя из общей суммы 10% от неё.
//   Используйте переменные для количества товаров и цен, а также для расчёта скидки и итоговой стоимости

let coffee: Int = 100
let tea: Int = 80
let cupcake = 200

var summForOrder: Int = coffee * 1 + tea * 2 + cupcake * 4
let sale = Float(summForOrder) * 0.1

var summaryWithSale: Int = summForOrder - Int(sale)


//2. Создайте переменную для хранения текущей температуры воздуха и константу для обозначения точки замерзания воды.

let currentTemperature: Int = -10
//   Создайте булеву переменную isCold которая вернет true либо false. Если вода замерзает то вернет true, если нет false

let frozeWaterTemperature: Int = -1
//   Выведите значени isCold true или false на экран консоли (без использования if else)

var isCold: Bool = currentTemperature <= frozeWaterTemperature

print("water frozen: ", isCold)

isCold = currentTemperature >= frozeWaterTemperature

print("water frozen: ", isCold)

//
//3. Создайте переменные для хранения цены товара без НДС и ставки НДС в процентах.

let price: Float = 1000
let nds: Float = 20

//   Вычислите итоговую стоимость товара с НДС.
let summNds: Float = price * nds * 0.01
let summaryPrice: Float = price + summNds

//Создайте булеву переменную isExpensive,
//   которая будет возвращать true, если итоговая стоимость товара превышает 1000 рублей,
//   и false в противном случае.

var isExpensive: Bool

//Используйте математические операторы для вычисления стоимости
//    с НДС и логические операторы для определения значения isExpensive. Выведите результат в консоль.

isExpensive = summaryPrice > 1000

print("summaryPrice: ", summaryPrice, "price more 1000: ", isExpensive)


//4. Рассчитайте среднюю скорость движения автомобиля на основе пройденного расстояния (в километрах)
//   и времени в пути (в часах).
//   Создайте переменные для хранения расстояния и времени, а также константу
//   для максимально допустимой средней скорости (например, 90 км/ч).

let disance: Int = 500
let time: Int = 4
let maxArrangeSpeed: Int = 90

//   Вычислите среднюю скорость и создайте булеву переменную isOverSpeed, которая
//   будет возвращать true, если средняя скорость превышает максимально
//   допустимую, и false — в противном случае. Используйте математические операторы для вычисления средней скорости
//   и логический оператор для определения значения isOverSpeed. Выведите в консоль сообщение, указывающее, превышена
//   ли максимально допустимая скорость.

let isOverSpeed: Bool

let arrangeSpeed = disance/time

isOverSpeed = arrangeSpeed > maxArrangeSpeed

print("maxArangeSpeed > 90: ", isOverSpeed)

//5. Сравните две числовые переменные: А и В. Проверьте, является ли А меньше, больше или равно В.
//   Используйте логические операторы, чтобы определить, выполняется ли одновременно несколько условий: например, а меньше В,
//   и одновременно а не равно нулю. Результатом должна быть переменная result, содержащая true или false.

let a: Int = 100
let b: Int = 200

var result: Bool = a < b && a != 0

print(result)

//6. Даны три переменные: age для возраста пользователя, minAge для минимального возраста, дающего право на
//   получение водительских прав, и testPassed для обозначения успешного прохождения теоретического теста на
//   права (true/false). Проверьте, может ли пользователь получить водительские права. Пользователь может
//   получить права, если его возраст больше или равен minAge и он успешно прошёл тест. Создайте переменную
//   canObtainLicense и присвойте ей результат проверки true либо false
//
//   let age = 20
//   let minAge = 18
//   let testPassed = true
//
//   let canObtainLicense = вместо этого текста тут должны использоваться логические и условные операторы
//print("Может ли пользователь получить водительские права: \(canObtainLicense)")

let age = 20
let minAge = 18
let testPassed = false

let canObtainLicense = age >= minAge && testPassed
print("Может ли пользователь получить водительские права: \(canObtainLicense)")


//7. Проверьте, достаточно ли у пользователя денег для покупки товара. У вас есть переменные walletBalance
//   для баланса кошелька пользователя, itemPrice для цены товара и hasDiscountCoupon для наличия скидочного
//   купона (true/false). Если у пользователя достаточно денег для покупки или у него есть скидочный купон
//   (предположим, купон дает скидку, делая покупку возможной независимо от баланса), создайте переменную
//   canPurchase и присвойте ей результат проверки. Выведите результат.
//
//   let walletBalance = 500
//   let itemPrice = 450
//   let hasDiscountCoupon = true
//
//   let canPurchase = вместо этого текста тут должны использоваться логические и условные операторы
//print("Может ли пользователь совершить покупку: \(canPurchase)")

let walletBalance = 300
let itemPrice = 450
let hasDiscountCoupon = true

let canPurchase = walletBalance > itemPrice || hasDiscountCoupon
print("Может ли пользователь совершить покупку: \(canPurchase)")



//8. Представьте, что вы планируете поездку на машине и хотите убедиться, что у вас есть достаточно топлива.
//   У вас есть переменные currentFuel в литрах для текущего количества топлива, distanceToDestination в километрах
//   до пункта назначения, и fuelEfficiency в километрах на литр, показывающая, как далеко может проехать машина на
//   одном литре топлива. Проверьте, хватит ли топлива, чтобы доехать до пункта назначения без дозаправки. Создайте
//   переменную canReachDestination и присвойте ей результат проверки. Выведите результат в консоль.


let currentFuel = 29.0 // литры
let distanceToDestination = 300.0 // км
let fuelEfficiency = 10.0 // км/л



let canReachDestination = (distanceToDestination / fuelEfficiency) <= currentFuel
print("Можем ли мы доехать до пункта назначения без дозаправки: \(canReachDestination)")




