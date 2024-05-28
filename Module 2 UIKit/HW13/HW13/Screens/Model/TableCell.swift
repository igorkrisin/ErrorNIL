//
//  TableCell.swift
//  HW13
//
//  Created by Игорь Крысин on 12.05.2024.
//

import Foundation

struct TableCell: Identifiable {
   
    
    var id = UUID().uuidString
    var iconImage: String
    var descriptionText: String
    
    static func createData() -> [TableCell] {
        [
            TableCell(iconImage: "image 1", descriptionText: "Lorem ipsum dolor sit amet consectetur."),
            TableCell(iconImage: "image 2", descriptionText: "Lorem ipsum dolor sit amet consectetur."),
            TableCell(iconImage: "image 3", descriptionText: "Lorem ipsum dolor sit amet"),
            TableCell(iconImage: "image 4", descriptionText: "Lorem ipsum dolor"),
        ]
        
    }
}
