//
//  FontProvider.swift
//  HW13
//
//  Created by Игорь Крысин on 15.05.2024.
//

import UIKit

enum UbuntuType: String {
    case regular = "Ubuntu-Regular"
    case lightItalic = "Ubuntu-LightItalic"
    case medium = "Ubuntu-Medium"
    case bold = "Ubuntu-Bold"
}
//Family: Ubuntu Font names: ["Ubuntu-Regular", "Ubuntu-Italic", "Ubuntu-LightItalic", "Ubuntu-Medium", "Ubuntu-MediumItalic", "Ubuntu-Bold", "Ubuntu-BoldItalic"]

extension UIFont {
    static func getUbuntuFont(fontType: UbuntuType = .regular, size: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
