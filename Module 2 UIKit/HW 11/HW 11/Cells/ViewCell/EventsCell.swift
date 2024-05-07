//
//  EventsCell.swift
//  HW 11
//
//  Created by Игорь Крысин on 03.05.2024.
//

import UIKit

class EventsCell: UICollectionViewCell {
    static var reusedId: String = "EventsCell"
    
    lazy var eventStack: UIStackView = UIComponents.createStack(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
    lazy var iconImage: UIImageView = UIComponents.creatImage(height: 25, width: 25, cornerRad: 0)
    lazy var textLabel: UILabel = UIComponents.createTextLabel(sizeFont: 14, fontWeight: .regular, numbOfLine: 1, textColor: .black)
    lazy var arrowBtn: UIButton = UIComponents.createButton(titleText: "", textColor: .clear, action: nextViewAction)
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
        [iconImage, textLabel, arrowBtn].forEach {
            eventStack.addArrangedSubview($0)
        }
        
        addSubview(eventStack)
        
        iconImage.image = UIImage(named: item.image)
        textLabel.text = item.textLabel
        arrowBtn.setImage(.arrowBtn, for: .normal)
        backgroundColor = .white
        NSLayoutConstraint.activate([
            eventStack.topAnchor.constraint(equalTo: topAnchor),
            eventStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            eventStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            eventStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
        ])
    }
    
    
}
