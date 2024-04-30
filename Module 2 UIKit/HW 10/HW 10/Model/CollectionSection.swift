//
//  CollectionSection.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import Foundation

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let group: [CollectionItem]
    
    static func makeDate() -> [CollectionSection] {
        let storyGroup = [
            CollectionItem(image: "story1", name: "Name 1"),
            CollectionItem(image: "story2", name: "Name 2"),
            CollectionItem(image: "story3", name: "Name 3"),
            CollectionItem(image: "story4", name: "Name 4"),
            CollectionItem(image: "story1", name: "Name 1"),
            CollectionItem(image: "story2", name: "Name 2"),
            CollectionItem(image: "story3", name: "Name 3"),
            CollectionItem(image: "story4", name: "Name 4")
        ]
        
        let messageGroup = [
            CollectionItem(image: "image1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "image2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "image3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "image4", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let captionGroup = [
            CollectionItem(image: "image1", header: "Заголовок 1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "image2", header: "Заголовок 2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "image3", header: "Заголовок 3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let scrolDownlGroup = [
            CollectionItem(image: "circleImg1"),
            CollectionItem(image: "circleImg2"),
            CollectionItem(image: "circleImg1"),
            CollectionItem(image: "circleImg2"),
            CollectionItem(image: "circleImg1"),
            CollectionItem(image: "circleImg2"),
        ]
        
        
        
        let storySection = CollectionSection(header: "Stories", group: storyGroup)
        let messageSection = CollectionSection(header: "Message", group: messageGroup)
        let captionSection = CollectionSection(header: "Caption", group: captionGroup)
        let scrollDownSection = CollectionSection(header: "ScrollDown", group: scrolDownlGroup)
        
        return [storySection, messageSection, captionSection, scrollDownSection]
    }
}

