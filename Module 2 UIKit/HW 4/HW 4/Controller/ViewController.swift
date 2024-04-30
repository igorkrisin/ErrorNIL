//
//  ViewController.swift
//  HW 4
//
//  Created by Игорь Крысин on 07.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var actionCircleButton = UIAction { [ weak self] action in
        print(1)
    }

    lazy var buttonDots: UIButton = UIComponents.createButton(size: CGSize(width: 49, height: 49), cornerRadius: 0, image: .dots, backGroundColor: .clear, points: CGPoint(x: myImageView.frame.width - 29 - 49, y: 21), action: actionCircleButton, tintColor: .white)
    
    lazy var nameApp: UILabel = {
        $0.text = "perepihon.RU"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.frame.origin = CGPoint(x: 30, y: 63)
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 36)
        return $0
    }(UILabel())
    
    lazy var myImageView: UIImageView = {
        $0.layer.cornerRadius = 40
        $0.image = .womanPhoto
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: 127, width: view.frame.width - 60, height: 392)))
    
    
    lazy var hStackLogo: UIStackView = {
        
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
       
        $0.spacing = 12
        
        $0.frame.size = CGSize(width: 126, height: 34)
        $0.frame.origin = CGPoint(x: 30, y: 28)
       
        let instaLOgoBtn = UIComponents.createCircleButton(size: CGSize(width: 34, height: 34), cornerRadius: 17, image: .instaLogo, backGroundColor: .black, action: actionCircleButton)
        let tikTokLogoBtn = UIComponents.createCircleButton(size: CGSize(width: 34, height: 34), cornerRadius: 17, image: .tikTokLogog, backGroundColor: .black, action: actionCircleButton)
        let vkLogoBtn = UIComponents.createCircleButton(size: CGSize(width: 34, height: 34), cornerRadius: 17, image: .vkLogo, backGroundColor: .black, action: actionCircleButton)
        
    
            
        
        $0.addArrangedSubview(instaLOgoBtn)
        $0.addArrangedSubview(tikTokLogoBtn)
        $0.addArrangedSubview(vkLogoBtn)
        
        return $0
    } (UIStackView())
    
    lazy var labelName: UILabel = {
        $0.text = "Имя Фамилия Name"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var icon: UIImageView = {
        $0.image = .iconBlue
        $0.contentMode = .scaleAspectFit
        $0.frame.size = CGSize(width: 29, height: 29)
        return $0
    } (UIImageView())
    
    
    lazy var hStakName: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .leading
        $0.addArrangedSubview(labelName)
        $0.addArrangedSubview(icon)
        return $0
    }(UIStackView())
    
    lazy var yaerLabel: UILabel = {
        $0.text = "25 лет"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var vStackYarName: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.frame.size = CGSize(width: myImageView.frame.width - 60, height: 50)
        $0.frame.origin = CGPoint(x: 30, y: myImageView.frame.height - 70 - 26)
        $0.addArrangedSubview(hStakName)
        $0.addArrangedSubview(yaerLabel)
        return $0
    }(UIStackView())
    
    lazy var crossButton = UIComponents.createButton(size: CGSize(width: 65, height: 65), cornerRadius: 32.5, image: .cross2, backGroundColor: .appGray, points: CGPoint(x: 30, y: 547), action: actionCircleButton, tintColor: .black)
    
    lazy var heartButton = UIComponents.createButton(size: CGSize(width: 65, height: 65), cornerRadius: 32.5, image: .heart2, backGroundColor: .appGray, points: CGPoint(x: 305, y: 547), action: actionCircleButton, tintColor: .appRed)
    
    lazy var greenButton: UIButton = {
        $0.setTitle("Написать", for: .normal)
        
        $0.frame.size = CGSize(width: 187, height: 50)
        $0.frame.origin = CGPoint(x: 106, y: 555)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .appGreen
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: actionCircleButton))
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [nameApp, myImageView, crossButton, greenButton, heartButton].forEach{view.addSubview($0)}
        [hStackLogo, buttonDots, vStackYarName].forEach{myImageView.addSubview($0)}
        
        // Do any additional setup after loading the view.
    }


}

