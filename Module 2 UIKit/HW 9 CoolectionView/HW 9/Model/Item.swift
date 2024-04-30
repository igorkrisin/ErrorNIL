
import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
    var avatar: String
    var userName: String
    var image: String
    var date: String
    var caption: String
    var description: String
    
    static func makeDataObj() -> [Item] {
        [
            Item(avatar: "avatar1", userName: "User name 1", image: "image1", date: "12.01.21", caption: "Caption1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "),
            Item(avatar: "avatar2", userName: "User name 2", image: "image2", date: "22.02.22", caption: "Caption2", description: "LLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore "),
            Item(avatar: "avatar3", userName: "User name 3", image: "image3", date: "23.03.23", caption: "Caption3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "),
            Item(avatar: "avatar1", userName: "User name 1", image: "image1", date: "12.01.21", caption: "Caption1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "),
            Item(avatar: "avatar2", userName: "User name 2", image: "image2", date: "22.02.22", caption: "Caption2", description: "LLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore "),
            Item(avatar: "avatar3", userName: "User name 3", image: "image3", date: "23.03.23", caption: "Caption3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "),
         
        ]
    }
    
}
