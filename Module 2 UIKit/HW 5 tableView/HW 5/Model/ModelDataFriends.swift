

import Foundation

struct ModelDataFriends: Identifiable {
    var id: String = UUID().uuidString
    var image: String = ""
    var nameLabel = ""
    var countMessage: Int = 0
    
    static func createListFriends() -> [[ModelDataFriends]] {
        [
            [
                ModelDataFriends(image: "profilePhoto", nameLabel: "Катя Тапочкина", countMessage: 30),
                ModelDataFriends(image: "womanPhoto", nameLabel: "Маша Пуговкина", countMessage: 30),
                ModelDataFriends(image: "profilePhoto", nameLabel: "Имя Фамилия", countMessage: 30),
                ModelDataFriends(image: "profilePhoto", nameLabel: "Имя Фамилия", countMessage: 30)
            ],
            [
                ModelDataFriends(image: "womanPhoto", nameLabel: "Имя Фамилия", countMessage: 40),
                ModelDataFriends(image: "womanPhoto", nameLabel: "Имя Фамилия", countMessage: 50),
                ModelDataFriends(image: "womanPhoto", nameLabel: "Имя Фамилия", countMessage: 60),
                ModelDataFriends(image: "womanPhoto", nameLabel: "Имя Фамилия", countMessage: 70)
            ]
        ]
    }
    
}
