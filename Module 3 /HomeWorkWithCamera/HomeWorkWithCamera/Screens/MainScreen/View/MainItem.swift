//
//  MainItem.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 13.07.2024.
//

import UIKit

protocol MainItemDelegate: AnyObject {
    func didTapAddTagButton()
}


class MainItem: UICollectionViewCell, MainItemDelegate {
    
    private let storageManager = StorageManager()
   
    var completion: (()->())?
    
    static var reusedId = "MainItem"
    
    let viewWidth = UIScreen.main.bounds.width
    
    weak var delegate: MainItemDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var view: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    private lazy var descriptionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var tagLabel: UILabel = {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var addTagBtn: UIButton = {
        $0.setTitle("Add tag", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .none
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(didTapAddTagButton), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc func didTapAddTagButton() {
        completion?()
    }

    
    func setupCell(item: Note, tag: Tag?, folderName: String) {
        backgroundColor = .lightGray
        layer.cornerRadius = 20
        addSubview(self.view)
        [imageView, descriptionLabel, tagLabel, addTagBtn, dateLabel].forEach {
            self.view.addSubview($0)
        }
        if let imgData = storageManager.loadImage(folder: folderName, imageName: item.image ?? "") {
            imageView.image = UIImage(data: imgData)
        }
        
        
        descriptionLabel.text = item.descripText
        if let tag = tag {
            tagLabel.text = tag.name ?? ""
        }
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString: String? = item.date != nil ? dateFormatter.string(from: item.date!) : nil

        dateLabel.text = dateString
        
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: viewWidth - 60),
            
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            tagLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            tagLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            tagLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            
            addTagBtn.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 10),
            addTagBtn.leadingAnchor.constraint(equalTo: tagLabel.leadingAnchor),
            addTagBtn.widthAnchor.constraint(equalToConstant: 100),
            
            dateLabel.topAnchor.constraint(equalTo: addTagBtn.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            addTagBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            
        
        ])
    }
    
}



