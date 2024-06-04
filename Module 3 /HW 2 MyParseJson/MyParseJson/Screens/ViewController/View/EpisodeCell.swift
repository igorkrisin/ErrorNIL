//
//  EpisodeCell.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 02.06.2024.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    var completion: (() -> Void)?
    
    static let reuseId: String = "EpisodeCell"
    
    lazy private var mainView: UIView = {
        return $0
    }(UIView(frame: bounds))

    lazy private var nameEpisodeLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.numberOfLines = 2
        return $0
    }(UILabel(frame: CGRect(x: 20, y: contentView.frame.height / 2 - 35, width: contentView.frame.width - 200, height: 70)))
    
    lazy private var pushCharacterBtn: UIButton =  {
        $0.setTitle("See character", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.addAction(actionBtn, for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(x: contentView.frame.width - 150, y: contentView.frame.height / 2 - 15, width: 130, height: 30)))
    
    private lazy var actionBtn = UIAction { [weak self] sender in
        self?.completion?()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCell(item: Results) {
        nameEpisodeLabel.text = item.name
        
        addSubviewToView()
    }
    
    func addSubviewToView() {
        addSubview(mainView)
        [nameEpisodeLabel, pushCharacterBtn].forEach {
            mainView.addSubview($0)
        }
    }
    
    
    
}
