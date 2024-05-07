//
//  cellProtocol.swift
//  HW 11
//
//  Created by Игорь Крысин on 03.05.2024.
//

import Foundation

protocol CellProtocol: AnyObject {
    static var reuseId: String { get }
    func setupCell(item: CollectionItem)
    
}
