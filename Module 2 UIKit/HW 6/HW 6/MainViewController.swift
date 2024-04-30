//
//  ViewController.swift
//  HW 6
//
//  Created by Игорь Крысин on 13.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var tableData = Item.createArrayData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(ItemCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.setupCell(item: tableData[indexPath.row])
        cell.selectionStyle = .none
        let item = tableData[indexPath.row]
        cell.completion = {
            let vc = DescriptionViewController()
            vc.item = item
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width
    }
}
