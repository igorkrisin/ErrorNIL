//
//  MessageViewController.swift
//  HW 11
//
//  Created by Игорь Крысин on 04.05.2024.
//

import UIKit

class MessageViewController: UIViewController {
    
    private var makeArrayData = MessageTableItem.makeTableDate()
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: MessageTableItem.reuseIde)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        
        tableView.contentInset = UIEdgeInsets(top: 54, left: 0, bottom: 0, right: 0  )
    }
    
}


extension MessageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        makeArrayData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        makeArrayData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableItem.reuseIde, for: indexPath)
        
        let cellForTable = makeArrayData[indexPath.section][indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = cellForTable.userName
        config.secondaryText = cellForTable.messageText
        config.textProperties.font = UIFont.systemFont(ofSize: 16)
        config.image = UIImage(named: makeArrayData[indexPath.section][indexPath.row].userImage)
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        config.imageProperties.cornerRadius = (config.image?.size.width ?? 0) / 2
        config.secondaryTextProperties.numberOfLines = 2
        cell.contentConfiguration = config
        cell.accessoryType = .none
        return cell
    }
    
    
}

extension MessageViewController: UITableViewDelegate {
    
}
