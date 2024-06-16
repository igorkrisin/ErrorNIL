//
//  CharacterCollectionViewCell.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 02.06.2024.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CharacterCollectionViewCell"

    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: bounds))
    
    lazy var nameCharacterLabel: UILabel = {
        return $0
    }(UILabel())
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: String) {
        //print("item.image: ", item.image)
        addSubview(imageView)
        imageView.load(url: URL(string: item)!)
    }
    
}
