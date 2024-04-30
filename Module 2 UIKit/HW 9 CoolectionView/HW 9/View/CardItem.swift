//
//  CardItem.swift
//  HW 9
//
//  Created by Игорь Крысин on 24.04.2024.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseId: String { get }
}

class CardItem: UICollectionViewCell, CellProtocol {
    static var reuseId: String = "CardItem"
    
    var viewWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .appGray
        self.viewWidth = UIScreen.main.bounds.width
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLabel = createLabel(fontSize: 20, weightFont: .black, textColor: .black)
    lazy var dateLabel = createLabel(fontSize: 14, weightFont: .light, textColor: .appTextGray)
    lazy var captionLabel = createLabel(fontSize: 22, weightFont: .bold, textColor: .black)
    lazy var descriptionText = createLabel(fontSize: 16, weightFont: .regular, textColor: .black)
    
    lazy var avatar: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.widthAnchor.constraint(equalToConstant: 44).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        $0.layer.cornerRadius = 22
        return $0
    }(UIImageView())
    
    lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    
    
    func setupCell(item: Item) {
        
        [nameLabel, dateLabel, captionLabel, descriptionText, image, avatar].forEach {
            addSubview($0)
        }
        
        image.image = UIImage(named: item.image)
        nameLabel.text = item.userName
        dateLabel.text = item.date
        captionLabel.text = item.caption
        descriptionText.text = item.description
        avatar.image = UIImage(named: item.avatar)
        
        let imageRatio = image.image?.getRatio()
        
        NSLayoutConstraint.activate([
            
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            image.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: viewWidth - 70),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: imageRatio ?? 1),
            
            dateLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            captionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            captionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            captionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionText.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
            
            
        ])
        
    }
    
    func createLabel(fontSize: CGFloat, weightFont: UIFont.Weight, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weightFont)
        label.textColor = textColor
        return label
    }
}


extension UIImage {
    func getRatio() -> CGFloat {
        self.size.height / self.size.width
    }
}
