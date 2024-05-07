//
//  ImageViewController.swift
//  HW 6
//
//  Created by Игорь Крысин on 14.04.2024.
//

import UIKit

class ImageViewController: UIViewController {
    var imageName: String = ""
    
    lazy var image: UIImageView = {
        $0.image = UIImage(named: imageName)
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(image)
    }

}
