import Foundation
"""
Преобразование и фильтрация:

У вас есть массив строк, представляющих числа. Напишите функцию, которая преобразует этот массив строк в массив целых чисел и затем фильтрует только положительные числа, используя map и filter.
-------------------------------------------------
"""


var stringArray = ["1", "2", "3", "4", "5", "-6"]

var intArray: [Int] = stringArray.map{ Int($0) ?? 0}.filter{$0 > 0}

//print(intArray)

"""
Поиск самого длинного слова в массиве строк:

Дан массив строк. Напишите функцию, которая находит самое длинное слово в массиве, используя map.

"""

var arrayString = ["dfsdfsdfds", "dsfds", "dsfdsfs", "rrererteryt", "ioiopioi", "nbmnbbmnnbmbnmnbnmbbnm"]

func longestWordInArray(_ array: [String]) -> String {
    let str: String? =  array.map { $0 } // Создаем массив копий строк
                    .max(by: { $0.count < $1.count })
    
    guard let myStr = str else { return " "}
    return myStr
}

//print(longestWordInArray(arrayString))

"""
Умножение матрицы из чисел на скаляр:

Дана матрица и скалярное значение. Напишите функцию, которая умножает каждый элемент матрицы на скаляр, используя map.
"""

let scalar: Int = 2

let matrix: [[Int]] = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

func multiplication(matrix: [[Int]], scalar: Int) -> [[Int]]  {
    let result = matrix.map { row in
        return row.map{ element in
            return element * scalar
        }
        
    }
    return result
}

//print(multiplication(matrix: matrix, scalar: scalar))


"""
Объединение массива массивов в один массив, удалив дубликаты:

Дан массив массивов. Напишите функцию, которая объединяет все подмассивы в один массив, удаляя дубликаты, используя map и reduce.
"""

let array2D: [[Int]] = [
    [1,5,3],
    [4,5,6],
    [7,8,9]
]


func mergeArrayRemoveDuplicate(_ array2D: [[Int]]) -> [Int] {
    return array2D.flatMap{ $0 }.reduce([]) { (result, element) in
        return result.contains(element) ? result : result + [element]
        
    }
    
    
}

//print(mergeArrayRemoveDuplicate(array2D))

"""
Преобразование словаря в другой формат данных:

У вас есть словарь с именами и возрастами. Напишите функцию, которая преобразует этот словарь в массив кортежей, содержащих имена и годы рождения, используя map.
-------------------------------------------------
"""

var array = ["alex": 18, "sergey": 20]


func convertDictionaryToList(_ dict: [String:Int]) -> [(String, Int)] {
    let date = Date()
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: date)
    //print(calendar)
    return dict.map{ ($0.key, currentYear - $0.value) }
}

//print(convertDictionaryToList(array))

"""
Поиск наибольшей последовательности подряд идущих чисел:

Дан массив целых чисел. Напишите функцию, используя reduce, чтобы найти наибольшую последовательность подряд идущих чисел и вернуть её длину.
-------------------------------------------------
"""

    func longestConsecutiveSequenceLength(_ nums: [Int]) -> Int {
        let longestLength = nums.reduce((maxCount: 0, currentCount: 0)) { (result, num) in
                var currentCount = result.currentCount
                
                // Проверяем, если текущее число следует за предыдущим
                if let index = nums.firstIndex(of: num), index > 0, nums[index - 1] == num - 1 {
                    currentCount += 1
                } else {
                    currentCount = 1 // Если не следует, начинаем новую последовательность
                }
                
                // Обновляем наибольшую длину последовательности
                let maxCount = max(result.maxCount, currentCount)
                
                return (maxCount: maxCount, currentCount: currentCount)
            }.maxCount
            
            return longestLength
    }

    // Пример использования:
    let numbers = [100, 101, 102, 104, 105, 107, 108, 109]
    let result = longestConsecutiveSequenceLength(numbers)
    print("Длина наибольшей последовательности подряд идущих чисел: \(result)")


"""
Подсчет суммы элементов матрицы:

Дана матрица. Напишите функцию, используя reduce, чтобы вычислить сумму всех элементов матрицы.

"""

let matrix2: [[Int]] = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

func amountElemMatrix(_ matrix: [[Int]]) -> Int {
    return matrix.flatMap{ $0 }.reduce(0) { (result, element) in
        return element + result
    }
}

//print(amountElemMatrix(matrix2))

"""
Слияние и упорядочивание нескольких массивов:
let array1 = [3, 1, 4]
let array2 = [2, 9, 5]
let array3 = [7, 8, 6]
Дан массив массивов. Напишите функцию, используя reduce, чтобы объединить все массивы в один и отсортировать его.
Результат должен выглядеть так [1, 2, 3, 4, 5, 6, 7, 8, 9]
"""

let array1 = [3, 1, 4]
let array2 = [2, 9, 5]
let array3 = [7, 8, 6]

func joinArrays(arra1: [Int], array2: [Int], array3: [Int]) -> [Int] {
    var summArray = [arra1, array2, array3]
    return summArray.reduce([]) { (result, array) in
        return result + array
    }.sorted()
}

print(joinArrays(arra1: array1, array2: array2, array3: array3))













