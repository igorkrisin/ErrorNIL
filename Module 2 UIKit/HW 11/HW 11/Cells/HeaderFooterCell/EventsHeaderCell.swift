//
//  EventsHeaderCell.swift
//  HW 11
//
//  Created by Игорь Крысин on 03.05.2024.
//

import UIKit

class EventsHeaderCell: UICollectionReusableView {
    static var reuseId = "EventsHeaderCell"
    
    lazy var headerStack = UIComponents.createStack(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
    lazy var headerText = UIComponents.createTextLabel(sizeFont: 20, fontWeight: .bold, numbOfLine: 1, textColor: .black)
    lazy var headerBtn = UIComponents.createButton(titleText: "Подробнее", textColor: .appBlue, action: headerBtnAction)
    
    private lazy var headerBtnAction = UIAction { [weak self] action in
       print("Header BTN Events")
        
    }
    
    func setupCell(header: String){
        addSubview(headerStack)
        headerStack.addArrangedSubview(headerText)
        headerStack.addArrangedSubview(headerBtn)
        headerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        headerText.text = header
       
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        
        ])
    }
}
