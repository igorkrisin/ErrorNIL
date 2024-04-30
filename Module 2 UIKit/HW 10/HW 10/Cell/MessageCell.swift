//
//  MessageCell.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import UIKit

class MessageCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "MessageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appGray
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = UIComponents.createImageView(width: 60, height: 60, cornerRad: 20)
    
    lazy var textLabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    func setupCell(item: CollectionItem) {
        
        addSubview(imageView)
        addSubview(textLabel)
        
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            //imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            
            
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            //textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
    }

    
}
