//
//  StoryCell.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseID: String { get }
    var imageView: UIImageView { get set}
    func setupCell(item: CollectionItem)
}

class StoryCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "StoryCell"
    
    lazy var imageView: UIImageView = UIComponents.createImageView(width: 80, height: 80, cornerRad: 40)
    
    
    lazy var nameLabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    func setupCell(item: CollectionItem) {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor , constant:  5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
        
    }
    
    
}
