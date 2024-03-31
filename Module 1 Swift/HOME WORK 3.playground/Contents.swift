
import Foundation
//Задание 1: Сортировка чисел
// Описание: Вам предоставлен массив чисел. Реализуйте функцию, которая возвращает отсортированный массив чисел в порядке возрастания.
// Требования:
// Не используйте встроенную функцию sort().
// Функция должна принимать массив чисел в качестве параметра.
// Функция должна возвращать новый отсортированный массив.
// Подсказки:
// Используйте алгоритм "пузырьковой сортировки" или другие базовые алгоритмы сортировки.

func bubleSort(array: [Int]) -> [Int] {
    var newArray = array
    for i in 0..<newArray.count - 1 {
        for j in 0..<newArray.count - i - 1 {
            if newArray[j] > newArray[j+1] {
                newArray.swapAt(j, j+1)
            }
        }
    }
    
    return newArray
}

//print(bubleSort(array: [3,1,56,33,12, 101, 0]))


//Задание 2: Проверка на палиндром
//Описание: Реализуйте функцию, которая определяет, является ли предоставленная строка палиндромом.
//Требования:
//Функция должна принимать строку в качестве параметра.
//Функция должна возвращать true, если строка является палиндромом, и false в противном случае.
//Подсказки:
//При проверке на палиндром регистр символов и пробелы часто не учитывают. Рассмотрите преобразование всех символов в нижний регистр и удаление пробелов.
//Палиндром это - слово или фраза, которые одинаково читаются слева направо и справа налево.
//"Палиндром «ого! как Мадам Анна тут как тут 99 левел Казак тут Заказ зараз шабаш »


func isPalindrom(str: String) -> Bool {
   
    var arrayStore: [String] = []
    let words = str.lowercased().split(separator: " ")
    arrayStore = words.map {String($0)}
    if arrayStore.count == 0 {
        return false
    }
    for i in 0..<arrayStore.count {
        if String(arrayStore[i]) != String(arrayStore[i].reversed()) {
            return false
        }
    }
    return true
}

//print(isPalindrom(str: " "))



//Задание 3: Сумма элементов массива
//Описание: Реализуйте функцию, которая определяет сумму всех элементов предоставленного массива целых чисел.
//Требования:
//Функция должна принимать массив целых чисел в качестве параметра.
//Функция должна возвращать целое число - сумму всех элементов массива.
//Подсказки:
//Воспользуйтесь циклом для перебора и суммирования элементов массива.

func summValueArray(array: [Int]) -> Int {
    var summ: Int = 0
    for i in 0..<array.count {
        summ += array[i]
    }
    return summ
}

//print(summValueArray(array: [0, 1, 2, 3, 5]))

//Задание 4: Конвертер температур
//Описание: Создайте функцию, которая конвертирует температуру из градусов Цельсия в градусы Фаренгейта.
//Требования:
//Функция должна принимать температуру в градусах Цельсия в качестве параметра.
//Функция должна возвращать эквивалентную температуру в градусах Фаренгейта.
//Подсказки:
//Используйте формулу: fahrenheit = (celsius * 9.0/5.0) + 32.0 для конвертации.


func convertTemperature(celsius: Float) -> Float {
    return (celsius * 9.0/5.0) + 32.0
}

//print(convertTemperature(celsius: 25))

//Задание 5: Записная книжка
//Описание: Создайте простую записную книжку, которая позволяет хранить контактные данные: имя, телефон и электронную почту.
//Требования:
//Используйте массив для хранения записей.
//Каждая запись должна быть словарем, содержащим поля: имя, телефон, электронная почта.
//Реализуйте функцию поиска записи по имени.
//Подсказки:
//Возможно, потребуется использовать цикл для поиска по массиву и проверки каждого имени на совпадение.

let noteBook: [[String:String]] = [["name":"Fedor", "phone":"89992345466", "email":"fed@gmail.com"], ["name":"Ivan", "phone":"89992390466", "email":"iv@gmail.com"], ["name":"Alex", "phone":"89992397890", "email":"alks@gmail.com"]]

func findNoteForName(name: String, noteBook: [[String:String]]) -> [String:String] {
    for note in noteBook {
        if note["name"]?.lowercased() == name.lowercased() {
            return note
        }
    }
    return ["":""]
}

//print(findNoteForName(name: "alex", noteBook: noteBook))

//Задание 6: Перестановка элементов массива
//Описание: Реализуйте функцию, которая меняет местами первый и последний элементы массива.
//Требования:
//Функция должна принимать массив в качестве параметра.
//Функция должна возвращать новый массив, где первый элемент стал последним, а последний — первым. Остальные элементы должны остаться без изменений.
//Подсказки:
//Воспользуйтесь индексацией массива для обмена значениями элементов.

var array: [Int] = [1,2,3,4,5]
var strArray: [String] = ["first", "second"]

func swapLastFirstElement<T>(array: [T]) -> [T] {
    if array.isEmpty {
        return []
    }
    var newarray = array
    var tempStore: T
    tempStore = newarray[0]
    newarray[0] = newarray[newarray.count - 1]
    newarray[newarray.count - 1] = tempStore
    
    
    return newarray
}

//print(swapLastFirstElement(array: strArray))


//Задание 7: Форматирование строки
//Описание: Создайте функцию, которая делает первую букву каждого слова в строке заглавной.
//Требования:
//Функция должна принимать строку в качестве параметра.
//Функция должна возвращать новую отформатированную строку.
//Подсказки:
//Рассмотрите разбиение строки на массив слов, затем примените к каждому слову преобразование, после чего объедините массив обратно в строку.

var str: String = "привет как дела"

func firstLitterUpperCase(str: String) -> String {
    if str.isEmpty {
        return ""
    }
    let array: [String] = str.split(separator: " ").map({String($0)})
    var newString: String = ""
    for i in 0..<array.count {
        //print(String(array[i][array[i].startIndex]).uppercased() + array[i].dropFirst())
        if i == array.count - 1 {
            newString += String(array[i][array[i].startIndex]).uppercased() + array[i].dropFirst()
        } else {
            newString += String(array[i][array[i].startIndex]).uppercased() + array[i].dropFirst() + " "
        }
    }
    return newString
}


//print(firstLitterUpperCase(str: str))

//Задание 8: Конвертация дня недели
//Описание: Создайте функцию, которая принимает день недели в виде строки и возвращает его в числовом формате (например, "Понедельник" -> 1).
//Требования:
//Функция должна принимать день недели в качестве строки.
//Функция должна возвращать соответствующее число.
//Подсказки:
//Рассмотрите использование словаря для хранения соответствия между названиями дней недели и числами.

func convertWeekDays(days: String) -> Int {
    let weekDays: [[Int: String]] = [
        [1:"monday"],
        [2:"tuesday"],
        [3:"wendsday"],
        [4:"thursday"],
        [5:"friday"],
        [6:"saturday"],
        [7:"sunday"]
    ]
    var i = 1
    for day in weekDays {
        if day[i]! == days.lowercased() {
            return i
        }
        i+=1
    }
    print("thath day is not exist")
    return 0
}

//print(convertWeekDays(days: "sunday"))


//Задание 9: Уникальные символы
//Описание: Напишите функцию, которая определяет, являются ли все символы в строке уникальными.
//Требования:
//Функция должна принимать строку в качестве параметра.
//Функция должна возвращать true, если все символы уникальны, и false в противном случае.
//Подсказки:
//Можно использовать множество (Set) для хранения уникальных символов и сравнения его размера со строкой.

func unicSimbol(for string: String) -> Bool {
    var set: Set<Character> = []
    for char in string {
        if char.isLetter && set.contains(char) {
            return false
        } else if char.isLetter {
            set.insert(char)
        }
    }
    
    return true
}


//print(unicSimbol(for: ""))


//адание 10: Слияние массивов
//Описание: Напишите функцию, которая объединяет два массива в один.
//Требования:
//Функция должна принимать два массива в качестве параметров.
//Функция должна возвращать новый массив, состоящий из элементов обоих исходных массивов.
//Подсказки:
//Можно использовать оператор + для объединения двух массивов.

func concatTwoArray<T>(array1: [T], array2: [T]) -> [T] where T: Hashable {
    return array1 + array2
}

//print(concatTwoArray(array1: [1,2,3], array2: [4,5,6]))


//Задание 11: Подсчет гласных
//Описание: Напишите функцию, которая определяет количество гласных букв в строке.
//Требования:
//Функция должна принимать строку в качестве параметра.
//Функция должна возвращать целое число — количество гласных букв в строке.
//Подсказки:
//Создайте набор или список гласных и используйте его для проверки каждого символа в строке.

func countVolwes(string: String) -> Int {
    let array: [Character] = ["a", "e", "u", "o", "y", "i"]
    var сountVolwe: Int = 0
    for char in string {
        for i in 0..<array.count {
            if char == array[i] {
                сountVolwe += 1
            }
        }
    }
    return сountVolwe
}

//print((countVolwes(string: "yuoi")))


//адание 12: Удаление дубликатов из массива
//Описание: Напишите функцию, которая удаляет все повторяющиеся элементы из массива.
//Требования:
//Функция должна принимать массив в качестве параметра.
//Функция должна возвращать новый массив без дубликатов.
//Подсказки:
//Можно использовать тип данных Set для временного хранения уникальных элементов.


func removeDuplicateElement(from array: [Int]) -> [Int] {
    var storeSet = Set<Int>()
    var newArray: [Int] = []
    for elem in array {
        if !storeSet.contains(elem) {
            newArray.append(elem)
        }
        storeSet.insert(elem)
    }
    return newArray
}

//print(removeDuplicateElement(from: [2,1,2,2, 2,3,4,5,6,2]))


//Задание 13: Сумма чисел до N
//Описание: Разработайте функцию, которая считает сумму всех чисел от 1 до заданного числа N.
//Требования:
//Функция должна принимать число N в качестве параметра.
//Функция должна возвращать целое число — сумму чисел от 1 до N.
//Подсказки:
//Воспользуйтесь формулой арифметической прогрессии или простым циклом для расчета.

func summDigit(for digit: Int) -> Int{
    if digit == 0 {
        return 0
    }
    var summ: Int = 0
    for i in 1...digit {
        summ += i
    }
    return summ
}

//print(summDigit(for: 10))


//Задание 14: Длинное слово в строке
//Описание: Напишите функцию, которая определяет самое длинное слово в предоставленной строке.
//Требования:
//Функция должна принимать строку в качестве параметра.
//Функция должна возвращать самое длинное слово.
//Подсказки:
//Разбейте строку на слова и используйте цикл для поиска слова с наибольшей длиной.

func findLongerWord(from string: String) -> String {
    if string.isEmpty {
        return ""
    }
    var indexMaxLetterInWord = 0
    var maxCountLetter = 0
    var arrayWords: [String] = string.split(separator: " ").map{String($0)}
    for i in 0..<arrayWords.count {
        print(arrayWords[i].count)
        if arrayWords[i].count > maxCountLetter {
            indexMaxLetterInWord = i
            maxCountLetter = arrayWords[i].count
        }
    }
    
    return arrayWords[indexMaxLetterInWord]
}

print(findLongerWord(from: ""))


//Задание 15: Сокращение строки
//Описание: Создайте функцию, которая сокращает строку до указанной длины, добавляя "..." в конец, если строка была усечена.
//Требования:
//Функция должна принимать строку и число N (длина, до которой следует усечь строку) в качестве параметров.
//Функция должна возвращать сокращенную строку.
//Подсказки:
//Учитывайте длину строки "..." при усечении исходной строки.

func trimSentence(sentnce: String, maxCountLetter: Int) -> String {
    var newSentence: String = sentnce
    if newSentence.count > maxCountLetter {
        newSentence.prefix(maxCountLetter)
        newSentence += "..."
    }
    
    return newSentence
}

print(trimSentence(sentnce: "", maxCountLetter: 5))


//Задание 16: Объединение двух массивов без дубликатов
//Описание: Разработайте функцию, которая объединяет два массива, удаляя повторяющиеся элементы.
//Требования:
//Функция должна принимать два массива в качестве параметров.
//Функция должна возвращать новый массив, состоящий из элементов обоих массивов, но без дубликатов.
//Подсказки:
//Воспользуйтесь структурой данных Set для удаления дубликатов и последующего преобразования обратно в массив.


func concatArrayWithoutDouplacate<T>(array1: [T], array2: [T]) -> [T] where T: Hashable {
    var storeSet: Set<T> = []
    var newArray: [T] = []
    for elem in concatTwoArray(array1: array1, array2: array2) {
        storeSet.insert(elem)
    }
    
    for elem in storeSet {
        newArray.append(elem)
    }
    
    return newArray
}


//print(concatArrayWithoutDouplacate(array1: [1], array2: []))


//Задание 17: Количество слов заданной длины
//Описание: Напишите функцию, которая определяет, сколько слов заданной длины содержится в строке.
//Требования:
//Функция должна принимать строку и число N (длина слова) в качестве параметров.
//Функция должна возвращать целое число — количество слов указанной длины.
//
//Подсказки:
//Разбейте строку на слова и используйте цикл для подсчета слов с заданной длиной.

func countWords(lenght: Int, sentence: String) -> Int {
    var wordArray: [String] = sentence.split(separator: " ").map{String($0)}
    var countWords = 0
    for word in wordArray {
        if word.count == lenght {
            countWords += 1
        }
    }
    return countWords
}

//print(countWords(lenght: 5, sentence: "sasa sasad sdsd ss sddfg"))


//Задание 18: Угадай число
//Описание: Реализуйте игру, в которой пользователь пытается угадать число, которое случайно выбрано компьютером.
//Требования:
//Компьютер выбирает случайное число между 1 и 100.
//Пользователь делает попытки угадать число.
//После каждой попытки компьютер должен сообщать, больше или меньше угаданное число по сравнению с выбранным.
//Подсказки:
//Воспользуйтесь встроенной функцией для генерации случайных чисел Int.random(1...100).
//Организуйте цикл для многократного получения ответа от пользователя.

//отдлельным файлом GuessDigit



//Задание 19: Простой шифратор и дешифратор слов
//Описание: Создайте систему шифрования и дешифрования на основе замены букв.
//Требования:
//Создайте функцию encode, которая заменяет каждую букву следующей по алфавиту (a на b, b на c и т. д.).
//Создайте функцию decode, которая производит обратную замену.
//Учтите, что после z идет a.
//Подсказки:
//Используйте Unicode-значения символов для их замены.
//При достижении "z" используйте условный оператор для возврата к "a".

func encode(str: String) -> String {
    var newStr: String = ""
    for letter in str {
        if letter == "z" {
            newStr += "a"
            continue
        }
        var ascii = (letter.asciiValue ?? 0) + 1
        var newLetter = String(UnicodeScalar(ascii))
        newStr += newLetter
        
    }
    return newStr
}

//print(encode(str: "asdffgz"))


func decode(str: String) -> String {
    var newStr: String = ""
    for letter in str {
        if letter == "a" {
            newStr += "z"
            continue
        }
        var ascii = (letter.asciiValue ?? 0) - 1
        var newLetter = String(UnicodeScalar(ascii))
        newStr += newLetter
        
    }
    return newStr
}

//print(decode(str: "bteggha"))

//Задание 20: Конвертация времени из секунд
//Описание: Создайте функцию, которая конвертирует заданное количество секунд в часы, минуты и секунды.
//Требования:
//Функция принимает число (секунды) в качестве параметра.
//Функция возвращает строку, представляющую собой время в формате "ЧЧ:ММ:СС".
//Подсказки:
//Используйте деление и остаток от деления для вычисления часов, минут и секунд.

func convertSecondToTimer(seconds: Int) -> String {
    
    var hourses = "\(seconds / 3600):"
    var minutes =  "\(seconds % 3600 / 60):"
    var seconds = "\(seconds % 3600 % 60)"
    
    return hourses + minutes + seconds
}

print(convertSecondToTimer(seconds: 5450))












