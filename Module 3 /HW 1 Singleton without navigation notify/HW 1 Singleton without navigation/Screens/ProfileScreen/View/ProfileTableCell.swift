//
//  ProfileTableCell.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 27.05.2024.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    
    lazy private var mainView: UIView = {
        return $0
    }(UIView(frame: bounds))
    
    lazy private var grayCellView: UIView = {
        $0.backgroundColor = .bgCellGray
        $0.isUserInteractionEnabled = true
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        return $0
    }(UIView(frame: CGRect(x: 0, y: 5, width: mainView.frame.width, height: mainView.frame.height)))
    
    lazy private var icon: UIImageView = {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .white
        return $0
    }(UIImageView(frame: CGRect(x: 14, y: grayCellView.frame.midY - 15, width: 20, height: 18)))
    
    lazy private var nameCell: UILabel = UIComponents.createLabel(fontSize: 14, weight: .light, color: .white, numberofLines: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        backgroundColor = .black
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(grayCellTapped))
        grayCellView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func grayCellTapped() {
        print("grayCellView")
    }
    
    func setupCell(cell: ProfileModelCell) {
        addSubview(mainView)
        mainView.addSubview(grayCellView)
        grayCellView.addSubview(icon)
        grayCellView.addSubview(nameCell)
        
        icon.image = UIImage(systemName: cell.icon)
        nameCell.text = cell.nameCell
        
        nameCell.centerYAnchor.constraint(equalTo: grayCellView.centerYAnchor).isActive = true
        nameCell.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 27).isActive = true
        
    }

}
