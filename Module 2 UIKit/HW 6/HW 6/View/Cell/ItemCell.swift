//
//  ItemCell.swift
//  HW 6
//
//  Created by Игорь Крысин on 13.04.2024.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    var completion: (() -> Void)?
    
    lazy var labelForMainImage: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .left
        $0.textColor = .white
        return $0
    }(UILabel(frame: CGRect(x: 20, y: cellMainImageView.frame.height * 70/163, width: cellMainImageView.frame.width - 50, height: 24)))
    
    lazy var descriptionForImage: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
        $0.textAlignment = .left
        $0.textColor = .white
        $0.numberOfLines = 3
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel(frame: CGRect(x: 20, y: cellMainImageView.frame.height * 90/163, width: cellMainImageView.frame.width - 50, height: 51)))
    
    lazy var mainCellView: UIView = {
        return $0
    }(UIView(frame: bounds))
    
    lazy var grayCellView: UIView = {
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        
        return $0
    }(UIView(frame: CGRect(x: 25, y: 15, width: mainCellView.bounds.width - 50, height: mainCellView.bounds.height - 30)))
    
    
    
    lazy var cellMainImageView: UIImageView = {
        
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true

        return $0
    }(UIImageView(frame: CGRect(x: 25, y: grayCellView.frame.minY - 5, width: grayCellView.frame.width - 50, height: 163)))
    
    lazy var smallImage1: UIImageView = {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.frame.size = CGSize(width: 99, height: 99)
        return $0
    }(UIImageView())
    
    lazy var smallImage2: UIImageView = {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.frame.size = CGSize(width: 99, height: 99)
        return $0
    }(UIImageView())
    
    lazy var smallImage3: UIImageView = {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        //$0.frame.size = CGSize(width: 99, height: 99)
        return $0
    }(UIImageView())
    
   
    
    lazy var hStack: UIStackView = {
        
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 6
        $0.clipsToBounds = true
        
        $0.frame.size = CGSize(width: grayCellView.frame.width - 50, height: 99)
        $0.frame.origin = CGPoint(x: 25, y: grayCellView.frame.height * 190/370)
        
        
        return $0
    }(UIStackView())
    
    lazy var showButton: UIButton = {
        $0.setTitle("show details", for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(frame: CGRect(x: 25, y: grayCellView.frame.height * 306/370, width: grayCellView.frame.width - 50, height: 49), primaryAction: UIAction(handler: { _ in
        self.completion?()
    })))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    override func prepareForReuse() {
        cellMainImageView.image = nil
    }
    
    func setupCell(item: Item) {
        labelForMainImage.text = item.nameLabel
        descriptionForImage.text = item.description
        cellMainImageView.image = UIImage(named: item.mainImage)
        
        item.listImage.forEach {
            self.hStack.addArrangedSubview(setImage(name: $0))
        }
        
 
        addSubview(mainCellView)
        mainCellView.addSubview(grayCellView)
        grayCellView.addSubview(cellMainImageView)
        grayCellView.addSubview(hStack)
        grayCellView.addSubview(showButton)
        cellMainImageView.addSubview(labelForMainImage)
        cellMainImageView.addSubview(descriptionForImage)
      
    }
    
    func setImage(name: String) -> UIImageView {
        
        guard let image = UIImage(named: name) else  { return UIImageView() }
        
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 20
        imageView.frame.size = CGSize(width: 99, height: 99)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        return imageView
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
