//
//  FolderCell.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 27.06.2024.
//

import UIKit

class FolderCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])
    }
    
    func setupCell(item: FolderModelRealm) {
        nameLabel.text = item.name
        //print("item id: ", item.id)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
