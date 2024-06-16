//
//  ViewController.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    var name = ""
    var email = ""
    var password = ""
    
    private let regFireBaseModel = RegistrationFireBaseModel()
    
    var service = Service.shared
    
    var modelData = RegistrationModel.makeData()
    
    private lazy var registrationLabel: UILabel = UIComponents.createLabel(fontSize: 34.4, weight: .bold, color: .white, numberofLines: 1)
    
    private lazy var regStack: UIStackView = UIComponents.createStack(axis: .vertical, aligment: .center, distribution: .equalSpacing, spacing: 15)
    private lazy var nameTextField: UITextField = UIComponents.createTextField(placeHolder: "Имя")
    private lazy var postTextField: UITextField = UIComponents.createTextField(placeHolder: "Почта")
    private lazy var passwordTextField: UITextField = UIComponents.createTextField(placeHolder: "Пароль", isSecurity: true)
    
    private lazy var eyeBtn: UIButton = {
        $0.setImage(UIImage(systemName: "eye"), for: .normal)
        $0.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addAction(eyeBtnAction, for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .gray
        return $0
    }(UIButton(type: .custom))
    
    private lazy var eyeBtnAction = UIAction { [weak self] sender in
        self?.passwordTextField.isSecureTextEntry.toggle()
        self?.eyeBtn.isSelected.toggle()
    }

    
    private lazy var acceptPrivacy: UILabel = UIComponents.createLabel(fontSize: 14, weight: .regular, color: .grayText, numberofLines: 0)
    private lazy var registrationButton: UIButton = UIComponents.createButton(fontSize: 16, action: actionRegBtn, text: "РЕГИСТРАЦИЯ")
    
    private lazy var actionRegBtn = UIAction { [weak self] sender in
        guard let name = self?.nameTextField.text, !name.isEmpty else {self?.showAlert(message: "заполните имя"); return }
        guard let email = self?.postTextField.text, !email.isEmpty else {self?.showAlert(message: "заполните почту"); return }
        guard let password = self?.passwordTextField.text, !password.isEmpty else {self?.showAlert(message: "заполните пароль"); return }
        
        self?.service.nickName = name
        self?.service.email = email
        self?.service.userPassword = password
        
        let userData = UserData(name: Service.shared.nickName ?? "",
                                email: Service.shared.email ?? "" ,
                                password: Service.shared.userPassword ?? "")
        self?.regFireBaseModel.userRegistration(userData: userData) { result in
            switch result {
            case .success(let success):
                if success {
                    NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "auth"]))
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
       
    }
    
    private lazy var bottomStack: UIStackView = UIComponents.createStack(axis: .horizontal, aligment: .center, distribution: .equalSpacing, spacing: 5)
    
    private lazy var bottomLabel: UILabel = UIComponents.createLabel(fontSize: 19, weight: .regular, color: .grayText, numberofLines: 1)
    
    private lazy var entrenceBtn: UIButton = UIComponents.createButton(fontSize: 16, action: enterenceAction, text: "ВОЙТИ", bgColor: .black, titleColor: .appPurple)
    
    
    private lazy var enterenceAction = UIAction { [weak self] sender in
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "auth"]))
    }
    
    private lazy var eyeView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return $0
    }(UIView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createAddSubviewToView()
        setConstraints()
        setComponents()
    }
    
    func createAddSubviewToView() {
        
        [registrationLabel, regStack, acceptPrivacy, registrationButton, bottomStack].forEach {
            view.addSubview($0)
        }
        
        [nameTextField, postTextField, passwordTextField].forEach {
            regStack.addArrangedSubview($0)
        }
        
        [bottomLabel, entrenceBtn].forEach {
            bottomStack.addArrangedSubview($0)
        }
        
        //passwordTextField.addSubview(eyeView)
        eyeView.addSubview(eyeBtn)
       
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            regStack.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 23),
            regStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            regStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            nameTextField.leadingAnchor.constraint(equalTo: regStack.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: regStack.trailingAnchor),
            
            postTextField.leadingAnchor.constraint(equalTo: regStack.leadingAnchor),
            postTextField.trailingAnchor.constraint(equalTo: regStack.trailingAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: regStack.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: regStack.trailingAnchor),
            
            eyeBtn.centerXAnchor.constraint(equalTo: eyeView.centerXAnchor),
            eyeBtn.centerYAnchor.constraint(equalTo: eyeView.centerYAnchor),
            
            acceptPrivacy.topAnchor.constraint(equalTo: regStack.bottomAnchor, constant: 30),
            acceptPrivacy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            acceptPrivacy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            registrationButton.topAnchor.constraint(equalTo: acceptPrivacy.bottomAnchor, constant: 50),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            registrationButton.heightAnchor.constraint(equalToConstant: 71),
            
            bottomStack.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 30),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
    }
    
    func setComponents() {
        registrationLabel.text = modelData.captionLabel
        acceptPrivacy.text = modelData.acceptPrivacy
        bottomLabel.text = modelData.haveAccountLabel
        passwordTextField.rightView = eyeView
        passwordTextField.rightViewMode = .always
        
    }
    
    private func showAlert(message: String) {
            let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

}

