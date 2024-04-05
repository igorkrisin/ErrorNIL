//
//  ViewController.swift
//  HW2  Module 2
//
//  Created by Игорь Крысин on 31.03.2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var descriptionLabel = addLabel(descroption: "Добавить описание", frame: CGRect(x: 30, y: 341, width: 160, height: 19))
    lazy var changePassLabel = addLabel(descroption: "Изменить пароль", frame: CGRect(x: 30, y: 552, width: 150, height: 19))
    
    lazy var textFieldOldPass = addTextField(placeHolder: "Старый пароль", frame: CGRect(x: 30, y: 580, width: view.frame.width - 60, height: 52))
    lazy var textFieldNewPass = addTextField(placeHolder: "Новый пароль", frame: CGRect(x: 30, y: 646, width: view.frame.width  - 60, height: 52) )
    
    lazy var editBtn = createBtn(text: "редактировать", frame: CGRect(x: 146, y: 236, width: 147, height: 34))
    lazy var  saveBtn = createBtn(text: "Coxранить", frame: CGRect(x: 30, y: view.frame.height - 52 - 55, width: view.frame.width - 60 , height: 55))
    
    
    
    
    lazy var imageTopView: UIImageView = {
        $0.image = .nature
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 156)))
    
    lazy var avatarView: UIImageView = {
        $0.image = .avatar
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: 189, width: 100, height: 100)))
    
    lazy var userNameLable: UILabel = {
        $0.font = UIFont(name: "Inter", size: 16)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.text = "Имя фамилия"
        return $0
    }(UILabel(frame: CGRect(x: 146, y: 208, width: 113, height: 16)))

    
    lazy var textViewDescription: UITextView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 20
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return $0
    }(UITextView(frame: CGRect(x: 30, y: 369, width: view.frame.width - 60, height: 150)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        [imageTopView, avatarView, userNameLable, editBtn, descriptionLabel, textViewDescription, changePassLabel, textFieldOldPass, textFieldNewPass, saveBtn].forEach {
            view.addSubview($0)
        }
       
        // Do any additional setup after loading the view.
    }
    
    func addLabel(descroption: String, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.font = UIFont(name: "Inter", size: 16)
        label.text = descroption
        
        return label
    }
    
    func addTextField(placeHolder: String, frame: CGRect) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.placeholder = placeHolder
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 19))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }
    
    func createBtn(text: String, frame: CGRect) -> UIButton {
        let btn = UIButton(frame: frame)
        btn.backgroundColor = UIColor.blue
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter", size: 14)
        btn.layer.cornerRadius = 10
        return btn
    }
   


}

