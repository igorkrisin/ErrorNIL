//
//  TableItemModel.swift
//  Sui HW 4 Navigation
//
//  Created by Игорь Крысин on 28.07.2024.
//

import Foundation

struct TableItemModel: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var name: String
    var price: String
    var description: String
    var imageRoom: [String]
    var appartment: [DescriptionAppartment]
    
    static func mokeData() -> [TableItemModel] {
        [
            TableItemModel(image: "area1", name: "area1", price: "6 099 655 ₽", description: "Москва, поселение Сосенское, деревня Столбово", imageRoom:
                            [
                                "room1",
                                "room2",
                                "room3",
                                "room4",
                                
                            ],
                           appartment:
                            [
                                DescriptionAppartment(name: "Студии", price: "от 8 млн"),
                                DescriptionAppartment(name: "1-комн.", price: "от 10,1 млн ₽"),
                                DescriptionAppartment(name: "2-комн.", price: "от 11,1 млн ₽")
                            ]
                          ),
            TableItemModel(image: "area2", name: "area2", price: "7 099 655 ₽", description: "Городское поселение Горки Ленинские, Ленинский городской округ, Московская область", imageRoom:
                            [
                                "room1",
                                "room2",
                                "room3",
                                "room4",
                                
                            ],
                           appartment:
                            [
                                DescriptionAppartment(name: "Студии", price: "от 4,5 млн"),
                                DescriptionAppartment(name: "1-комн.", price: "от 5,1 млн ₽"),
                                DescriptionAppartment(name: "2-комн.", price: "от 7,1 млн ₽")
                            ]
                          ),
            TableItemModel(image: "area3", name: "area3", price: "8 099 655 ₽", description: "Сельское поселение Санки Сталирнское, Ленинский городской округ, Московская область", imageRoom:
                            [
                                "room1",
                                "room2",
                                "room3",
                                "room4",
                                
                            ],
                           appartment:
                            [
                                DescriptionAppartment(name: "Студии", price: "от 3,5 млн"),
                                DescriptionAppartment(name: "1-комн.", price: "от 4,1 млн ₽"),
                                DescriptionAppartment(name: "2-комн.", price: "от 6,1 млн ₽")
                            ]
                          ),
            TableItemModel(image: "area4", name: "area4", price: "6 099 655 ₽", description: " Ленинский городской округ",
                           imageRoom:
                            [
                                "room1",
                                "room2",
                                "room3",
                                "room4",
                                
                            ],
                           appartment:
                            [
                                DescriptionAppartment(name: "Студии", price: "от 2,5 млн"),
                                DescriptionAppartment(name: "1-комн.", price: "от 3,1 млн ₽"),
                                DescriptionAppartment(name: "2-комн.", price: "от 5,1 млн ₽")
                            ]
                          ),
        ]
        
    }
    
}

struct DescriptionAppartment {
    var name: String
    var price: String
}
