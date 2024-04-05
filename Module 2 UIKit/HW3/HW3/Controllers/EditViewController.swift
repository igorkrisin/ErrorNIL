//
//  EditViewController.swift
//  HW3
//
//  Created by Игорь Крысин on 04.04.2024.
//

import UIKit

class EditViewController: UIViewController {
    
    var onUpdateName: ((String, String) -> Void)?
    var onUpdateSecondName: ((String) -> Void)?
    var onUpdateTextView: ((String) -> Void)?
    
    var nameText = ""
    var secondNameText = ""
    var textDescriptonView = ""
    
    lazy var nameLabel: UILabel = createLabel(text: "Имя", frame: CGRect(x: 42, y: 97, width: 34, height: 19))
    lazy var nameTextField: UITextField = createTextField(placeholder: "", frame: CGRect(x: 30, y: 121, width: view.frame.width - 60, height: 51), background: .gray, cornerRadius: 15)
    lazy var secondNameLabel: UILabel = createLabel(text: "Фамилия", frame: CGRect(x: 42, y: 194, width: 82, height: 19))
    lazy var secondNameTextField: UITextField = createTextField(placeholder: "", frame: CGRect(x: 30, y: 218, width: view.frame.width - 60, height: 51), background: .gray, cornerRadius: 15)
    lazy var descriptionLabel: UILabel = createLabel(text: "Описание", frame: CGRect(x: 42, y: 291, width: 82, height: 19))
    
    
    lazy var descriptionTextView: UITextView = {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 15
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.font = UIFont(name: "Inter", size: 16)
        return $0
    }(UITextView(frame: CGRect(x: 30, y: 315, width: view.frame.width - 60, height: 144)))
    
    lazy var saveBtn: UIButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 30
        $0.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return $0
        
    }(UIButton(frame: CGRect(x: 30, y: view.frame.height - 133, width: view.frame.width - 60, height: 60)))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        nameTextField.text = nameText
        secondNameTextField.text = secondNameText
        descriptionTextView.text = textDescriptonView
        [ nameTextField, nameLabel, secondNameLabel, secondNameTextField, descriptionTextView, descriptionLabel, saveBtn].forEach {
            view.addSubview($0)
        }
    }
    
    
    private func createTextField(placeholder: String, frame: CGRect, background: UIColor, cornerRadius: CGFloat) -> UITextField {
        let textField = UITextField()
        textField.frame = frame
        textField.placeholder = placeholder
        textField.backgroundColor = background
        textField.layer.cornerRadius = cornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 19))
        textField.leftViewMode = .always
        return textField
    }
    
    private func createButton(text: String, frame: CGRect, background: UIColor, cornerRadius: CGFloat, action: UIAction) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(text, for: .normal)
        button.backgroundColor = background
        button.layer.cornerRadius = cornerRadius
        button.addAction(action, for: .touchUpInside)
        return button
        
    }
    
    private func createTextView(text: String, frame: CGRect, background: UIColor, cornerRadius: CGFloat) -> UITextView {
        let textView = UITextView(frame: frame)
        textView.text = text
        textView.backgroundColor = background
        textView.layer.cornerRadius = cornerRadius
        
        return textView
    }
    
    private func createLabel(text: String, frame: CGRect) -> UILabel {
        let label: UILabel = UILabel(frame: frame)
        label.text = text
        label.font = UIFont(name: "Inter", size: 16)
        
        return label
    }
    
    
    @objc func saveData() {
        onUpdateName?(nameTextField.text ?? "", secondNameTextField.text ?? "")
        onUpdateSecondName?(secondNameTextField.text ?? "")
        onUpdateTextView?(descriptionTextView.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }

}
