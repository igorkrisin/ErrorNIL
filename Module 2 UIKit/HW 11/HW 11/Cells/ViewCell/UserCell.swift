//
//  UserCell.swift
//  HW 11
//
//  Created by Игорь Крысин on 04.05.2024.
//

import UIKit

class UserCell: UICollectionViewCell {
    static var reuseId = "UserCell"
    
    lazy var stack = UIComponents.createStack(axis: .vertical, distribution: .equalSpacing, alignment: .center)
    lazy var userImage = UIComponents.creatImage(height: 50, width: 50, cornerRad: 25)
    lazy var userName = UIComponents.createTextLabel(sizeFont: 14, fontWeight: .bold, numbOfLine: 1, textColor: .black)
    lazy var descriptionLabel = UIComponents.createTextLabel(sizeFont: 14, fontWeight: .light, numbOfLine: 0, textColor: .appLightGray)
    lazy var writeBtn = UIComponents.createButton(titleText: "Написать", textColor: .appBlue, action: nextViewAction)
    private lazy var nextViewAction = UIAction { [weak self] action in
       print(2)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: CollectionItem) {
        addSubview(stack)
        [userImage, userName, descriptionLabel, writeBtn].forEach {
            stack.addArrangedSubview($0)
        }
        userImage.image = UIImage(named: item.image)
        userName.text = item.userName
        descriptionLabel.text = item.textLabel
        writeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        backgroundColor = .white
        layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
}
