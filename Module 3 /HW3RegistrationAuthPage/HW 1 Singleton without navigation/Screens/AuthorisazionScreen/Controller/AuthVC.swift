//
//  AuthVC.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import UIKit

final class AuthVC: UIViewController {
    
    var emailLabel: String = ""
    
    var service = Service.shared
    
    private var dataFromModel: AuthModel = AuthModel.makeData()
    
    private let authModel = AuthFireBaseModel()
    
    lazy private var caption: UILabel = UIComponents.createLabel(fontSize: 34, weight: .bold, color: .white, numberofLines: 1)
    
    lazy private var authStack: UIStackView = UIComponents.createStack(axis: .vertical, aligment: .center, distribution: .equalSpacing, spacing: 18)
    
    lazy private var postTextField: UITextField = UIComponents.createTextField(placeHolder: "Почта")
    lazy private var passTextField: UITextField = UIComponents.createTextField(placeHolder: "Пароль", isSecurity: true)
    
    lazy private var enterenceBtn: UIButton = UIComponents.createButton(fontSize: 16, action: actionEntrenceBtn, text: "ВОЙТИ")
    
    lazy private var actionEntrenceBtn = UIAction { [weak self] sender in
        guard let self = self else { return }
        
        guard let email = self.postTextField.text, !email.isEmpty else {self.showAlert(message: "заполните email" ); return }
        guard let password = self.passTextField.text, !password.isEmpty else { self.showAlert(message: "заполните пароль"); return }
        
        self.emailLabel = email
        let authUserData: AuthUserData = AuthUserData(email: email, password: password)
        authModel.singIn(userData: authUserData) { result in
            switch result {
            case .success(let success):
                if success == .noverifier {
                    self.showAlert(message: "Ошибка: Вы неверифиуированы")
                } else {
                    NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "profile"]))
                }
            case .failure(let failure):
                self.showAlert(message: "Ошибка: такого email несуществует или неверный пароль")
            }
        }
       
    }
    
    lazy private var bottomStack: UIStackView = UIComponents.createStack(axis: .horizontal, aligment: .center, distribution: .equalSpacing, spacing: 10)
    
    lazy private var haveAccountLabel: UILabel = UIComponents.createLabel(fontSize: 19, weight: .regular, color: .grayText, numberofLines: 1)
    
    lazy private var registrBtn: UIButton = UIComponents.createButton(fontSize: 16, action: actionRegBtn, text: "РЕГИСТРАЦИЯ", bgColor: .black, titleColor: .appPurple)
    
    lazy private var actionRegBtn = UIAction { [weak self] sender in
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "reg"]))
  
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubviewToView()
        setConstraints()
        setComponents()
    }
    
    func addSubviewToView() {
        [caption, authStack, enterenceBtn, bottomStack].forEach {
            view.addSubview($0)
        }
        
        [postTextField, passTextField].forEach {
            authStack.addArrangedSubview($0)
        }
        
        [haveAccountLabel, registrBtn].forEach {
            bottomStack.addArrangedSubview($0)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            caption.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caption.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            authStack.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 25),
            authStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            authStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            postTextField.leadingAnchor.constraint(equalTo: authStack.leadingAnchor),
            postTextField.trailingAnchor.constraint(equalTo: authStack.trailingAnchor),
            
            passTextField.leadingAnchor.constraint(equalTo: authStack.leadingAnchor),
            passTextField.trailingAnchor.constraint(equalTo: authStack.trailingAnchor),
            
            enterenceBtn.topAnchor.constraint(equalTo: authStack.bottomAnchor, constant: 60),
            enterenceBtn.leadingAnchor.constraint(equalTo: authStack.leadingAnchor),
            enterenceBtn.trailingAnchor.constraint(equalTo: authStack.trailingAnchor),
            enterenceBtn.heightAnchor.constraint(equalToConstant: 71),
            
            bottomStack.topAnchor.constraint(equalTo: enterenceBtn.bottomAnchor, constant: 29),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setComponents() {
        caption.text = dataFromModel.captionLabel
        haveAccountLabel.text = dataFromModel.dontHaveAccountLabel
    }
    
    private func showAlert(message: String) {
            let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
}
