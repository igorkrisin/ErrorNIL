//
//  ImageTableViewCell.swift
//  HW 7
//
//  Created by Игорь Крысин on 17.04.2024.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {
    
    lazy var grayView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 30
        return $0
    }(UIView())
    
    
    lazy var mainImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 239).isActive = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        return $0
    } (UIImageView())
    
    lazy var circleImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 63).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 63).isActive = true
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 31
        return $0
    } (UIImageView())
    
    
    
    lazy var descriptionText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var nextBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("next", for: .normal)
        $0.backgroundColor = .appGreen
        $0.tintColor = .white
        $0.layer.cornerRadius = 25
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    } (UIButton())
    
    lazy var nameLabel: UILabel =  {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var captionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return $0
    }(UILabel())
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: CellModel) {
        mainImage.image = UIImage(named: item.image)
        descriptionText.text = item.description
        circleImage.image = UIImage(named: item.circleImage)
        nameLabel.text = item.nameLabel
        captionLabel.text = item.captionLabel
        
        addSubview(grayView)
        //mainCellView.addSubview(grayView)
        
        [mainImage, descriptionText, nextBtn, captionLabel].forEach {
            grayView.addSubview($0)
        }
        
        mainImage.addSubview(circleImage)
        mainImage.addSubview(nameLabel)
       
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            grayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            grayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            grayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            grayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            
            mainImage.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 20),
            mainImage.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 20),
            mainImage.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -20),
            
            descriptionText.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 21),
            descriptionText.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -26),
            
            nextBtn.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -20),
            nextBtn.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 20),
            nextBtn.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -40),
            nextBtn.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 26),
            
            circleImage.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 20),
            circleImage.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -20),
            
            captionLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 21),
            captionLabel.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 26)
            
        ])
    }
}
