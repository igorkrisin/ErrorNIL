//
//  ViewController.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 27.06.2024.
//

import UIKit

class FolderVC: UIViewController {
    
    private lazy var arrayDataModel = realmManager.folder
    
    let realmManager = RealmManager()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        $0.style = .plain
        $0.image = UIImage(named: "plus")
        return $0
    }(UIBarButtonItem(systemItem: .add, primaryAction: UIAction { _ in
        self.createFoler()
    }))
    
    @objc func createFoler() {
        let folderName = UUID().uuidString
        realmManager.createFolder(name: folderName)
        self.tableView.reloadData()
    }
    
    lazy private var tableView: UITableView = {
        $0.register(FolderCell.self, forCellReuseIdentifier: FolderModel.identifier)
        $0.dataSource = self
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView(frame: view.frame))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        title = "Заметки"
        print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
    }


}


extension FolderVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worcVC = WorkVC()
        worcVC.titleData = arrayDataModel[indexPath.row].name
        worcVC.folder = arrayDataModel[indexPath.row]
        self.navigationController?.pushViewController(worcVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            realmManager.deleteFolder(folderId: arrayDataModel[indexPath.row].id)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension FolderVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(arrayDataModel.count)
        return arrayDataModel.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FolderModel.identifier, for: indexPath) as! FolderCell
        //print("cellFor: ", cell)
        cell.setupCell(item: arrayDataModel[indexPath.row])
        
        
        
//        let cellForTable = arrayDataModel[indexPath.row]
//        
//        var config = cell.defaultContentConfiguration()
//        config.text = cellForTable.name
//        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

