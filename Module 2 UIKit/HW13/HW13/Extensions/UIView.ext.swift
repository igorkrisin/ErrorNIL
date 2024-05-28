import Foundation
import UIKit


extension UIView {
    static func config<T: UIView>(view: T, completion: (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        completion(view)
        
        return view
    }
}
