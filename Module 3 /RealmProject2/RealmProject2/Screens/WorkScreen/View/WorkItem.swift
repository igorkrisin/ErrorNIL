//
//  WorkItem.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 28.06.2024.
//

import UIKit

protocol WorkItemProtocol: AnyObject {
    static var reusedId: String { get }
}

class WorkItem: UICollectionViewCell , WorkItemProtocol {
    private let storageManager = StorageManager()
    static var reusedId: String = "WorkItem"
    var folderName: String?
    
    lazy private var captionLable: UILabel = createLabel(fontSize: 20, weightFont: .bold)
    lazy private var descriptonText: UILabel = createLabel(fontSize: 16, weightFont: .light)
    
    var viewWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.viewWidth = UIScreen.main.bounds.width
    }
    
    lazy private var imageCell: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        captionLable.text = nil
        descriptonText.text = nil
        imageCell.image = nil
        
        NSLayoutConstraint.deactivate(contentView.constraints)
        
        NSLayoutConstraint.activate([
            
            captionLable.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            captionLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            captionLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            captionLable.widthAnchor.constraint(equalToConstant: viewWidth - 80),
            captionLable.heightAnchor.constraint(equalToConstant: 30),
            
            descriptonText.topAnchor.constraint(equalTo: captionLable.bottomAnchor, constant: 12),
            descriptonText.leadingAnchor.constraint(equalTo: captionLable.leadingAnchor),
            descriptonText.trailingAnchor.constraint(equalTo: captionLable.trailingAnchor),
            descriptonText.widthAnchor.constraint(equalToConstant: viewWidth - 80),
            
        ])
    }
    
    
    func setupCell(item: NoteModel?, folderName: String) {
        
        self.folderName = folderName
        [captionLable, descriptonText].forEach {
            addSubview($0)
        }
        captionLable.text = item?.captionName
        descriptonText.text = item?.descriptionName
        
        
        let hasImage = item?.image != nil
        
        guard let imageName = item?.image else { return }
        
        print(item?.image ?? "")
        
        if hasImage {
            if let img = storageManager.loadImage(folder: folderName, imageName: imageName){
                addSubview(imageCell)
                imageCell.image = UIImage(data: img)
            }
        } else {
            imageCell.removeFromSuperview()
        }
        
        let imageRatio = imageCell.image?.getRatio()
        
        NSLayoutConstraint.deactivate(contentView.constraints)
        
        NSLayoutConstraint.activate([
            
            captionLable.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            captionLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            captionLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            captionLable.widthAnchor.constraint(equalToConstant: viewWidth - 80),
            captionLable.heightAnchor.constraint(equalToConstant: 30),
            
            descriptonText.topAnchor.constraint(equalTo: captionLable.bottomAnchor, constant: 12),
            descriptonText.leadingAnchor.constraint(equalTo: captionLable.leadingAnchor),
            descriptonText.trailingAnchor.constraint(equalTo: captionLable.trailingAnchor),
            descriptonText.widthAnchor.constraint(equalToConstant: viewWidth - 80),
            
        ])
        
        if hasImage {
            NSLayoutConstraint.activate([
                
                imageCell.topAnchor.constraint(equalTo: descriptonText.bottomAnchor, constant: 12),
                imageCell.trailingAnchor.constraint(equalTo: descriptonText.trailingAnchor),
                imageCell.leadingAnchor.constraint(equalTo: descriptonText.leadingAnchor),
                imageCell.widthAnchor.constraint(equalToConstant: viewWidth - 80),
                imageCell.heightAnchor.constraint(equalTo: imageCell.widthAnchor, multiplier: imageRatio ?? 1),
                
                imageCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
        } else {
            NSLayoutConstraint.activate([
                descriptonText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
            
        }
            
    }
    
    
    func createLabel(fontSize: CGFloat, weightFont: UIFont.Weight, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weightFont)
        label.textColor = textColor
        return label
    }
    
   
}

extension UIImage {
    func getRatio() -> CGFloat {
        self.size.height / self.size.width
    }
}
