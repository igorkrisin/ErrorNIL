//
//  DescriptionViewController.swift
//  HW3
//
//  Created by Игорь Крысин on 04.04.2024.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var descriptionTextView = ""
    var titleDescrVc = ""
    
    lazy var profilePhoto: UIImageView = {
        $0.image = .profilePhoto
        $0.layer.cornerRadius = 20
        return $0
    } (UIImageView(frame: CGRect(x: view.center.x - 37.5, y: 95, width: 75, height: 75)))
    
    lazy var nameLabel: UILabel =  {
        $0.text = "Имя Фамилия"
        $0.textAlignment = .center
        return $0
    }(UILabel(frame: CGRect(x: 140, y: 193, width: 111, height: 19)))
    
    
    lazy var aboutMyselfLabel: UILabel =  {
        $0.text = "О себе"
        $0.font = UIFont(name: "Inter", size: 16)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.textColor = .gray
        return $0
    }(UILabel(frame: CGRect(x: 42, y: 245, width: 54, height: 19)))
    
    lazy var descriptionTextViewAboutMySelf: UITextView = {
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 15
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.text = descriptionTextView
        $0.font = UIFont(name: "Inter", size: 16)
        $0.isEditable = false
        return $0
    }(UITextView(frame: CGRect(x: 30, y: 273, width: view.frame.width - 60, height: 144)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = titleDescrVc
        [profilePhoto, nameLabel, aboutMyselfLabel, descriptionTextViewAboutMySelf].forEach {
            view.addSubview($0)
        }
    }
}
