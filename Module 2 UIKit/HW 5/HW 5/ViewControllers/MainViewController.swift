//
//  ViewController.swift
//  HW 5
//
//  Created by Игорь Крысин on 10.04.2024.
//

import UIKit



class MainViewController: UIViewController {
    
    private var arrayDataForTable = ModelDataFriends.createListFriends()
    var countMessage = 0
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
}


extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        arrayDataForTable.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayDataForTable[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        //let cellForTable = arrayDataForTable[indexPath.section][indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = cell.[indexPath.section][indexPath.row].arrayDataForTable
        config.secondaryText = "\(self.countMessage) сообщений"
        config.textProperties.font = UIFont.systemFont(ofSize: 16)
        config.image = UIImage(named:  arrayDataForTable[indexPath.section][indexPath.row].image)
        config.imageProperties.cornerRadius = (config.image?.size.width ?? 0) / 2
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}


extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arrayDataForTable[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = ProfileViewController()
        profileVC.сhangeImage =  arrayDataForTable[indexPath.section][indexPath.row].image
        profileVC.name = arrayDataForTable[indexPath.section][indexPath.row].nameLabel
        profileVC.delegate = self
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "New"
        }
        return "Best"
    }
}

extension MainViewController: ProfileVCDelegate {
    func profileViewController(_ controller: ProfileViewController, didUpdateData data: Any) {
        print("data: ", data)
        self.countMessage = data as! Int
        print("Count Message: ", self.countMessage)
        tableView.reloadData()
    }
    
    
}



