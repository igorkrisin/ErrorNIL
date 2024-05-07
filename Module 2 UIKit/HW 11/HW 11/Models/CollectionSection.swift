//
//  CollectionSection.swift
//  HW 11
//
//  Created by Игорь Крысин on 01.05.2024.
//

import Foundation

struct CollectionSection: Identifiable {
    var id: String = UUID().uuidString
    var header: String
    var footer: String?
    let group: [CollectionItem]
    
    static func makeData() -> [CollectionSection] {
        let newsGroup = [
            CollectionItem(image: "image1", textLabel: "Realm/ProjectWithRealm/ProjectWithRealm.xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace", captionLabel: "Какие-то новости?", date: "24.02.23"),
            CollectionItem(image: "image2", textLabel: "xcodeproj ProjectWithRealm.xcodeproj could not be loaded because it is already open from another project or workspace", captionLabel: "Какие-то новости, a?", date: "24.02.25"),
            CollectionItem(image: "image3", textLabel: "loaded because it is already open from another project or workspace", captionLabel: "Какие-то новости?", date: "27.02.24"),
        ]
        
        let eventsGroup = [
            CollectionItem(image: "icon1", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon2", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon3", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon4", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon5", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon6", textLabel: "Каой-то текст в бла-бла-бла"),
            CollectionItem(image: "icon1", textLabel: "Каой-то текст в бла-бла-бла"),
        
        ]
        
        let userGroup = [
            CollectionItem(image: "story1", textLabel: "Lorem ipsum dolor sit amet consectetur.", userName: "User Userovich1"),
            CollectionItem(image: "story2", textLabel: "Lorem ipsum dolor sit amet consectetur.", userName: "User Userovich2"),
            CollectionItem(image: "story3", textLabel: "Lorem ipsum dolor sit amet consectetur.", userName: "User Userovich3"),
            CollectionItem(image: "story4", textLabel: "Lorem ipsum dolor sit amet consectetur.", userName: "User Userovich4"),
            CollectionItem(image: "story1", textLabel: "Lorem ipsum dolor sit amet consectetur.", userName: "User Userovich5"),
        ]
        
        let newsSection = CollectionSection(header: "Новости", footer: "Lorem ipsum dolor sit amet consectetur. Enim suspendisse accumsan sed augue interdum velit aliquam lobortis donec.", group: newsGroup)
        let eventsSection = CollectionSection(header: "Cобытия", group: eventsGroup)
        let userSection = CollectionSection(header: "Пользователи", group: userGroup)
        
        return [newsSection, eventsSection, userSection]
        
    }
}
