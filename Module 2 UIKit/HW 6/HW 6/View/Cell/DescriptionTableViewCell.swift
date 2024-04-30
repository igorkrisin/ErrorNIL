//
//  DescriptionTableViewCell.swift
//  HW 6
//
//  Created by Игорь Крысин on 14.04.2024.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    lazy var mainCellView: UIView = {
        $0.backgroundColor = .appGray
        return $0
    }(UIView(frame: bounds))
    
    lazy var tableImage: UIImageView = {
        $0.frame = CGRect(x: 30, y: 20, width: mainCellView.frame.width - 60, height: 201)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    lazy var grayView: UIView = {
//        $0.
//        return $0
//    }(UIView(frame: bounds))
    
    
    func setupCell(nameImage: String) {
        tableImage.image = UIImage(named:nameImage)
        addSubview(mainCellView)
        mainCellView.addSubview(tableImage)
//        mainCellView.addSubview(grayView)
    }
   
}
