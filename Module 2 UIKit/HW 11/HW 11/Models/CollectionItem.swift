//
//  Model.swift
//  HW 11
//
//  Created by Игорь Крысин on 01.05.2024.
//

import Foundation

struct CollectionItem: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var textLabel: String
    var captionLabel: String?
    var userName: String?
    var date: String?
}
