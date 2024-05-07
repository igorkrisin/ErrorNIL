//
//  NewsCell.swift
//  HW 11
//
//  Created by Игорь Крысин on 01.05.2024.
//

import UIKit



class NewsCell: UICollectionViewCell, CellProtocol {
    static var reuseId: String = "NewsCell"
    
    lazy var imageView: UIImageView = UIComponents.creatImage(height: frame.height, width: frame.width, cornerRad: 20)
    lazy var captionText: UILabel = UIComponents.createTextLabel(sizeFont: 20, fontWeight: .black, numbOfLine: 1, textColor: .white)
    lazy var date: UILabel = UIComponents.createTextLabel(sizeFont: 12, fontWeight: .regular, numbOfLine: 1, textColor: .white)
    lazy var textLabel: UILabel = UIComponents.createTextLabel(sizeFont: 14, fontWeight: .light, numbOfLine: 3, textColor: .white)
    
    lazy var readButton: UIButton = UIComponents.createButton(titleText: "Читать", textColor: .white, action: readAction)
    
    private lazy var readAction = UIAction { [weak self] action in
       print(1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell(item: CollectionItem) {
        [imageView, captionText, date, textLabel, readButton].forEach {
            addSubview($0)
        }
        readButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        imageView.image = UIImage(named: item.image)
        captionText.text = item.captionLabel
        date.text = item.date
        textLabel.text = item.textLabel
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            captionText.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25),
            captionText.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            captionText.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12),
            
            date.topAnchor.constraint(equalTo: captionText.bottomAnchor, constant: 4),
            date.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            
            textLabel.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 9),
            textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            textLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12),
            
            readButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            readButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            //readButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -25)
            readButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -12)
        ])
    }
    
    
}
