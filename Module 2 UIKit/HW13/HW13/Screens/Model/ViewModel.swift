//
//  ViewModel.swift
//  HW13
//
//  Created by Игорь Крысин on 12.05.2024.
//

import Foundation

struct ViewModel {
    var mainCaption: String
    var mainDescripton: String
    var footerDescription: String
    
    static func makeData() -> ViewModel {
        ViewModel(mainCaption: "О нас", mainDescripton: "Lorem ipsum dolor sit amet, consectetur adipisicing elit", footerDescription: "Lorem ipsum dolor sit amet")
    }
}
