

import Foundation

struct MessageTableItem: Identifiable {
    static var reuseIde: String = "MessageTableItem"
    var id: String = UUID().uuidString
    var userImage: String
    var userName: String
    var messageText: String
    
    static func makeTableDate() -> [[MessageTableItem]] {
        [
            [
        MessageTableItem(userImage: "circleImg1", userName: "User1 Name1", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "profilePhoto", userName: "User2 Name2", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "womanPhoto", userName: "User3 Name3", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "profilePhoto", userName: "User4 Name4", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "womanPhoto", userName: "User5 Name5", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "profilePhoto", userName: "User6 Name6", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        MessageTableItem(userImage: "circleImg1", userName: "User7 Name7", messageText: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace"),
        
        ]
         ]
    }
}
