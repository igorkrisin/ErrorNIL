
import Foundation
import UIKit
class UIComponents {
    
   
    
    
    static func createCircleButton(size: CGSize, cornerRadius: CGFloat, image: UIImage, backGroundColor: UIColor, action: UIAction) -> UIButton {
        return {
            $0.frame.size = size
           
            $0.setImage(image, for: .normal)
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = backGroundColor
            $0.layer.cornerRadius = cornerRadius
            return $0
        }(UIButton(primaryAction: action))
    }
    
//    @objc func actionCircleButton() {
//        print(1)
//    }
    
    static func createButton(size: CGSize, cornerRadius: CGFloat, image: UIImage, backGroundColor: UIColor, points: CGPoint, action: UIAction, tintColor: UIColor) -> UIButton {
        return {
            $0.frame.size = size
            $0.frame.origin = points
            $0.setImage(image, for: .normal)
            $0.layer.cornerRadius = cornerRadius
            $0.backgroundColor = backGroundColor
            $0.tintColor = tintColor
            return $0
        }(UIButton(primaryAction: action))
    }
}
