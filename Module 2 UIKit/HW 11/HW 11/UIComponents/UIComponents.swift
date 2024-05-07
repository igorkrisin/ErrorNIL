//
//  UICompomemts.swift
//  HW 11
//
//  Created by Игорь Крысин on 01.05.2024.
//

import Foundation
import UIKit

struct UIComponents {
    static func creatImage(height: CGFloat, width: CGFloat, cornerRad: CGFloat) -> UIImageView {
        return {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFill
            $0.widthAnchor.constraint(equalToConstant: width).isActive = true
            $0.heightAnchor.constraint(equalToConstant: height).isActive = true
            $0.layer.cornerRadius = cornerRad
            $0.clipsToBounds = true
            return $0
        }(UIImageView())
    }
    
    static func createTextLabel(sizeFont: CGFloat, fontWeight: UIFont.Weight,  numbOfLine: Int, textColor: UIColor) -> UILabel {
        return {
            $0.font = UIFont.systemFont(ofSize: sizeFont, weight: fontWeight)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = numbOfLine
            $0.textColor = textColor
            return $0
        }(UILabel())
    }
    
    static func createButton(titleText: String, textColor: UIColor, action: UIAction) -> UIButton {
        return {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(titleText, for: .normal)
            $0.setTitleColor(textColor, for: .normal)
            $0.addAction(action, for: .touchUpInside)
            return $0
        }(UIButton())
    }
    
    static func createStack(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView {
        return {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = axis
            $0.distribution = distribution
            $0.alignment = alignment
            return $0
        }(UIStackView())
        
    }
    
}
