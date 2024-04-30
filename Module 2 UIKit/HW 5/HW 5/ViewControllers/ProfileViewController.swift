//
//  ProfileViewController.swift
//  HW 5
//
//  Created by Игорь Крысин on 10.04.2024.
//

import UIKit

protocol ProfileVCDelegate: AnyObject {
    func profileViewController(_ controller: ProfileViewController, didUpdateData data: Any)
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileVCDelegate?
    
    var сhangeImage: String = ""
    
    var name = ""
    var secondName = ""
    
    var textMessage: [String] = []
    
   // var arrayDataForTable: [ModelDataMessages] = ModelDataMessages.createMessageArray()
    
    lazy var arrayDataForTable = returnModelDataMessage(image: self.сhangeImage, name: self.name, text: textMessage)
    
    lazy var profileImage: UIImageView = {
        $0.frame.size = CGSize(width: 136, height: 136)
        $0.frame.origin.x = view.frame.width / 2 - $0.bounds.width / 2
        $0.frame.origin.y = 114
        $0.image = UIImage(named: self.сhangeImage)
        $0.layer.cornerRadius = $0.frame.width / 2
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    } (UIImageView())
    
    
    lazy var profileName: UILabel = {
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 24)
        $0.frame.origin = CGPoint(x: 30, y: 277)
        $0.text = self.name
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    
    lazy var profileTable: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "profileCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: CGRect(x: 0, y: 418, width: view.frame.width, height: view.frame.height / 2 - 30), style: .insetGrouped))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [profileName, profileImage, profileTable].forEach {
            view.addSubview($0)
        }
        view.addSubview(profileImage)
        // Do any additional setup after loading the view.
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayDataForTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTable.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = self.name
        config.secondaryText = arrayDataForTable[indexPath.row].text
        config.image = UIImage(named: self.сhangeImage)
        config.imageProperties.cornerRadius = (config.image?.size.width ?? 0) / 2
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        
        print("arrcount: ", arrayDataForTable.count)
        cell.contentConfiguration = config
        return cell
    }
    
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Messages"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        delegate?.profileViewController(self, didUpdateData: arrayDataForTable.count)
        arrayDataForTable.remove(at: indexPath.row)
        profileTable.deleteRows(at: [indexPath], with: .automatic)
    }
}
