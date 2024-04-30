//
//  ModelDataMessages.swift
//  HW 5
//
//  Created by Игорь Крысин on 10.04.2024.
//

import Foundation

struct ModelDataMessages: Identifiable {
    var id: String = UUID().uuidString
    var image: String = ""
    var name: String = ""
    var text: [String] = [""]
    
    
    
//    static func createMessageArray() -> [ModelDataMessages] {
//        return [ModelDataMessages(image: "", name: "Имя Фамилия", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"), ModelDataMessages(image: "Имя фамилия", name: "", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"), ModelDataMessages(image: "", name: "Имя Фамилия", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"), ModelDataMessages(image: "Имя фамилия", name: "", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod")]
//                               
//    }
    
}


func returnModelDataMessage(image: String, name: String, text:  [String]) -> [ModelDataMessages] {
    
    return [ModelDataMessages(image: image, name: name, text: text)]
    
}
