//
//  ViewController.swift
//  HW1 Module 2
//
//  Created by Игорь Крысин on 27.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var nameLabel: UILabel = UILabel()
    var nameLabelField: UILabel = UILabel()
    var surNameLabel: UILabel = UILabel()
    var surNameLabelField: UILabel = UILabel()
    var numberFlowLabel: UILabel = UILabel()
    var numberFlowLabelField: UILabel = UILabel()
    
    private lazy var btnAction = UIAction { [self] action in
        guard let sender = action.sender as? UIButton else { return }
        switch sender.tag {
        case 1:
            changingLabelText(label: nameLabelField, newText: "Igor" )
            changingLabelText(label: surNameLabelField, newText: "Krysin")
            changingLabelText(label: numberFlowLabelField, newText: "ios 7")
        case 2:
            removeTextLabel(label: nameLabelField)
            removeTextLabel(label: surNameLabelField)
            removeTextLabel(label: numberFlowLabelField)
        default:
           
            changingLabelText(label: nameLabel, newText: "Error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel = createLable(text: "Имя: ", frame: CGRect(x: 30, y: 100, width: 50, height: 30),  textColor: .black)
        self.nameLabelField = createLable(text: "Name ", frame: CGRect(x: 75, y: 100, width: 50, height: 30),  textColor: .red)
        self.surNameLabel = createLable(text: "Фамилия: ", frame: CGRect(x: 30, y: 130, width: 80, height: 30),  textColor: .black)
        self.surNameLabelField = createLable(text: "Surname ", frame: CGRect(x: 115, y: 130, width: 80, height: 30),  textColor: .red)
        self.numberFlowLabel = createLable(text: "Номер потока: ", frame: CGRect(x: 30, y: 160, width: 120, height: 30),  textColor: .black)
        self.numberFlowLabelField = createLable(text: "ios 6 ", frame: CGRect(x: 150, y: 160, width: 80, height: 30),  textColor: .red)
        
        
        let btnCreate = createBtn(title: "Добавить данные", frame: CGRect(x: 23, y: 650, width: 350, height: 69), backgroundColor: .black, titleColor: .white, tag: 1)
        let btnErase = createBtn(title: "Стереть данные", frame: CGRect(x: 23, y: 750, width: 350, height: 30), backgroundColor: .white, titleColor: .blue, tag: 2)
        
        view.addSubview(numberFlowLabel)
        view.addSubview(numberFlowLabelField)
        view.addSubview(surNameLabel)
        view.addSubview(surNameLabelField)
        view.addSubview(nameLabelField)
        view.addSubview(nameLabel)
        view.addSubview(btnCreate)
        view.addSubview(btnErase)
        
    }
    
    private func createBtn(title: String, frame: CGRect, backgroundColor: UIColor, titleColor: UIColor, tag: Int ) -> UIButton  {
        let btn = UIButton()
        btn.addAction(btnAction, for: .touchUpInside)
        btn.setTitle(title, for: .normal)
        btn.backgroundColor = backgroundColor
        btn.frame = frame
        btn.layer.cornerRadius = 20
        btn.setTitleColor(titleColor, for: .normal)
        btn.tag = tag
        return btn
        
    }
    
    private func createLable(text: String, frame: CGRect, textColor: UIColor) -> UILabel {
        let nameLabel: UILabel = UILabel()
        nameLabel.text = text
        nameLabel.textColor = textColor
        nameLabel.frame = frame
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return nameLabel
    }
    
    private func changingLabelText(label: UILabel, newText: String) {
        label.text = newText
    }
    
    private func removeTextLabel(label: UILabel) {
        label.text = ""
    }
}

