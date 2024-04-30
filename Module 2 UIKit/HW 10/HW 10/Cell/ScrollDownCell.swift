//
//  ScrollDownCell.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import UIKit

class ScrollDownCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "ScrollDownCell"
    
    lazy var imageView: UIImageView = UIComponents.createImageView(width: frame.width, height: frame.height, cornerRad: 20)
    
    func setupCell(item: CollectionItem) {
        addSubview(imageView)
        imageView.image = UIImage(named: item.image)
        
        
    }
    
    
}
