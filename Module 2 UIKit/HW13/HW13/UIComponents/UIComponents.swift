//
//  UIComponents.swift
//  HW13
//
//  Created by Игорь Крысин on 12.05.2024.
//

import Foundation
import UIKit

class UIComponents {
    static func createLabel(
        fontSize: CGFloat,
        weight:  UIFont.Weight,
        alignment: NSTextAlignment = .left,
        color:  UIColor,
        text: String,
        numberofLines: Int
    ) -> UILabel {
        {
            .config(view: $0) { createLabel in
                createLabel.font = .systemFont(ofSize: fontSize, weight: weight)
                createLabel.textAlignment = alignment
                createLabel.textColor = color
                createLabel.text = text
                createLabel.numberOfLines = numberofLines
            }
        }(UILabel())
    }
    
    static func createImageView(image: String, cornerRad: CGFloat) -> UIImageView {
        {
            .config(view: $0) { imageView in
                imageView.image = UIImage(named: image)
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = cornerRad
            }
        }(UIImageView())
    }
    
    static func createButton(title: String = "", image: String, width: CGFloat, height: CGFloat, action: UIAction) -> UIButton {
        {
            .config(view: $0) { button in
                button.setTitle(title, for: .normal)
                button.setImage(UIImage(named: image), for: .normal)
                button.widthAnchor.constraint(equalToConstant: width).isActive = true
                button.heightAnchor.constraint(equalToConstant: height).isActive = true
                button.isUserInteractionEnabled = true
                button.addAction(action, for: .touchUpInside)
            }
        }(UIButton())
    }
    
    static func createStack(axis: NSLayoutConstraint.Axis,
                            aligment: UIStackView.Alignment,
                            distribution: UIStackView.Distribution,
                            spasing: CGFloat
    ) -> UIStackView {
        {
            .config(view: $0) { stack in
                stack.axis = axis
                stack.alignment = aligment
                stack.distribution = distribution
                stack.spacing = spasing
                //stack.isUserInteractionEnabled = true
            }
        }(UIStackView())
    }
}
