//
//  UIComponents.swift
//  HW 10
//
//  Created by Игорь Крысин on 29.04.2024.
//

import Foundation
import UIKit

class UIComponents {
    
    static func createImageView(width: CGFloat, height: CGFloat, cornerRad: CGFloat) -> UIImageView {
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
    
    
    
    
}
