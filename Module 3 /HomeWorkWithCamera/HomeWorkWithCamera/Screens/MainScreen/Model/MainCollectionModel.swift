//
//  MainCollectionModel.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 13.07.2024.
//

import Foundation

struct MainCollectionModel {
    var id: String = UUID().uuidString
    var image: String
    var description: String
    var tag: String
    
    static func mokeData() -> [MainCollectionModel] {
        [
        MainCollectionModel(image: "img1", description: "бла бла блаkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", tag: "#хуй"),
        MainCollectionModel(image: "img1", description: "бла бла бла", tag: "#хуй"),
        
        ]
    }
}

