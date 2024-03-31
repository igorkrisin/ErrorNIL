//
//  ViewController.swift
//  HW2  Module 2
//
//  Created by Игорь Крысин on 31.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let image = UIImage(resource: .nature)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        // Do any additional setup after loading the view.
    }
    
    func createImage(image: UIImage) -> UIImageView {
        let viewImage = UIImageView(image: self.image)
        viewImage
        
        return viewImage
    }


}

