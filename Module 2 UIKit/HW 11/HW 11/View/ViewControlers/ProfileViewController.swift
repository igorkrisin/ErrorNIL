//
//  ProfileViewController.swift
//  HW 11
//
//  Created by Игорь Крысин on 05.05.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileElements = ProfileModel.makeItem()
    
    lazy var imageProfile: UIImageView = {
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        $0.image = UIImage(named: profileElements.imageProfile)
        return $0
    }(UIImageView(frame: CGRect(x: view.frame.midX - 50,  y: 100, width: 100, height: 100)))
    
    lazy var userName: UILabel = {
        $0.text = profileElements.nameUser
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
        return $0
    }(UILabel(frame: CGRect(x: 30, y: 250, width: view.frame.width - 60, height: 25)))
    
    lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        //$0.alignment = .firstBaseline
        return $0
    } (UIStackView(frame: CGRect(x: 30, y: 350, width: view.frame.width - 60, height: 80)))
    
    lazy var ageLabel: UILabel = UIComponents.createTextLabel(sizeFont: 16, fontWeight: .regular, numbOfLine: 1, textColor: .black)
    
    lazy var birtdhDayLabel: UILabel = UIComponents.createTextLabel(sizeFont: 16, fontWeight: .regular, numbOfLine: 1, textColor: .black)
    
    lazy var countryLabel: UILabel = UIComponents.createTextLabel(sizeFont: 16, fontWeight: .regular, numbOfLine: 1, textColor: .black)
    
    lazy var addBtn: UIButton = {
        $0.setTitle("Добавить в друзья", for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(actionBtn), for: .touchUpInside)
        return $0
    }( UIButton(frame: CGRect(x: 30, y: view.frame.height - 150, width: view.frame.width - 60, height: 50)))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [imageProfile, userName, stack, addBtn].forEach {
            view.addSubview($0)
        }
        setStackView()
        
    }
    
    func setStackView() {
        ageLabel.text = profileElements.age
        birtdhDayLabel.text = profileElements.birtday
        countryLabel.text = profileElements.country
        [ageLabel, birtdhDayLabel, countryLabel].forEach {
            stack.addArrangedSubview($0)
        }
    }
    
    @objc func actionBtn() {
        print(3)
    }
    
}
