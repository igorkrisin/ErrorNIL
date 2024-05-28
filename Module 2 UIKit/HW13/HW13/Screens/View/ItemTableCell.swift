//
//  ItemTableCell.swift
//  HW13
//
//  Created by Игорь Крысин on 13.05.2024.
//

import UIKit

final class ItemTableCell: UITableViewCell {
    
    static var reuseId = "ItemTableCell"
    
    lazy var mainCellView: UIView = {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        return $0
    }(UIView(frame: CGRect(x: 10, y: 10, width: blackCellView.bounds.width - 10, height: blackCellView.frame.height - 10)))
    
    lazy var blackCellView: UIView = {
        $0.backgroundColor = .black
        return $0
    }(UIView(frame: bounds))
    
    lazy var stackCell: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .leading
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    lazy var grayCircleView: UIView = {
        $0.backgroundColor = . appGray
        $0.layer.cornerRadius = 23
        return $0
    }(UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 46)))
    
    lazy var icon: UIImageView = {
        
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        //$0.frame.origin = CGPoint(x: grayCircleView.frame.midX, y: grayCircleView.frame.midY)
        
        return $0
    }(UIImageView(frame: CGRect(x: grayCircleView.frame.midX - 13, y: grayCircleView.frame.midX - 13, width: 23, height: 23)))
    
    lazy var descriptionCell: UILabel = {
        $0.font = .getUbuntuFont()
        $0.numberOfLines = 0
        return $0
    }(UILabel(frame: CGRect(x: 62, y: 0, width: frame.width - 100, height: mainCellView.frame.height - 26)))
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        
    }
    
    func setupCell(item: TableCell) {
        addSubviewToView()
        descriptionCell.text = item.descriptionText
        icon.image = UIImage(named: item.iconImage)
        
        NSLayoutConstraint.activate([
        
            stackCell.centerYAnchor.constraint(equalTo: mainCellView.centerYAnchor),
            stackCell.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 15),
            stackCell.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -15),
            stackCell.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -15),
        
        ])
    }
    
    func addSubviewToView() {
        [blackCellView].forEach {
            addSubview($0)
        }
        blackCellView.addSubview(mainCellView)
        
        mainCellView.addSubview(stackCell)
        
        [grayCircleView, descriptionCell].forEach {
            stackCell.addSubview($0)
        }
        grayCircleView.addSubview(icon)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
