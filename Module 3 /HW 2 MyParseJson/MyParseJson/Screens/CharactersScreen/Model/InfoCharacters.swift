//
//  Characters.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 02.06.2024.
//

import Foundation

struct InfoCharacters: Decodable {
    let results: [ResultsCharacter]
    
}


struct ResultsCharacter: Decodable {
    let image: String?
}
