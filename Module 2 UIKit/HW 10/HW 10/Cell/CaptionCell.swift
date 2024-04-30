//
//  CaptionCell.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import UIKit

class CaptionCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "CaptionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = UIComponents.createImageView(width: frame.width, height: frame.height, cornerRad: 10)
    
    lazy var caption: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    func setupCell(item: CollectionItem) {
        addSubview(imageView)
        addSubview(caption)
        addSubview(textLabel)
        
        
        caption.text = item.header
        textLabel.text = item.text
        imageView.image = UIImage(named: item.image)
        
        NSLayoutConstraint.activate([
            caption.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25),
            caption.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            
            textLabel.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            textLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
