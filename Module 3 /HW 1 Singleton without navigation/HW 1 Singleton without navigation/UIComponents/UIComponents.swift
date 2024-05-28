//
//  UIComponents.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import UIKit

class UIComponents {
    
    static func createLabel(
        fontSize: CGFloat,
        weight:  UIFont.Weight,
        alignment: NSTextAlignment = .left,
        color:  UIColor,
        numberofLines: Int
    ) -> UILabel {
        {
            .config(view: $0) { createLabel in
                createLabel.font = .systemFont(ofSize: fontSize, weight: weight)
                createLabel.textAlignment = alignment
                createLabel.textColor = color
                createLabel.numberOfLines = numberofLines
            }
        }(UILabel())
    }
    
    static func createStack(axis: NSLayoutConstraint.Axis,
                            aligment: UIStackView.Alignment,
                            distribution: UIStackView.Distribution,
                           spacing: CGFloat
    ) -> UIStackView {
        {
            .config(view: $0) { stack in
                stack.axis = axis
                stack.alignment = aligment
                stack.distribution = distribution
                stack.spacing = spacing
            }
        }(UIStackView())
    }
    
    static func createButton(fontSize: CGFloat,
                             titleAlignment: UIControl.ContentHorizontalAlignment = .center,
                             action: UIAction,
                             text: String,
                             bgColor: UIColor = .appPurple,
                             titleColor: UIColor = .white
                             
    ) -> UIButton {
        {
            .config(view: $0) { createButton in
                createButton.setTitle(text, for: .normal)
                createButton.contentHorizontalAlignment = titleAlignment
                createButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
                createButton.setTitleColor(titleColor, for: .normal)
                createButton.backgroundColor = bgColor
                createButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                createButton.layer.cornerRadius = 14
            }
        }(UIButton(type: .system, primaryAction: action))
    }
    
    static func createTextField(placeHolder: String,
                                bgColor: UIColor = .white,
                                cornRadius: CGFloat = 14,
                                isSecurity: Bool = false

    ) -> UITextField {
        {
            .config(view: $0) { textField in
                textField.placeholder = placeHolder
                textField.backgroundColor = bgColor
                textField.isSecureTextEntry = isSecurity
                textField.heightAnchor.constraint(equalToConstant: 71).isActive = true
                textField.layer.cornerRadius = cornRadius
                textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
                textField.leftViewMode = .always
                
                textField.isUserInteractionEnabled = true
            }
        }(UITextField())
    }
}


