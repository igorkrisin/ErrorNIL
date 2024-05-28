//
//  ProfileController.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import UIKit

class ProfileController: UIViewController {
    
    
    
    private var dataArray = ProfileModelCell.makeTableData()
    
    lazy private var captionLabel: UILabel = UIComponents.createLabel(fontSize: 35, weight: .regular, color: .white, numberofLines: 1)
    
    lazy private var profileImage: UIImageView = {
        $0.image = UIImage(resource: .profile)
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        return $0
    }(UIImageView(frame: CGRect(x: view.frame.midX - 75, y: 258, width: 150, height: 150)))
    
    lazy private var emailLAbel: UILabel = UIComponents.createLabel(fontSize: 28, weight: .regular, color: .white, numberofLines: 1)
    
    lazy private var tableView: UITableView = {
        $0.register(ProfileTableCell.self, forCellReuseIdentifier: ProfileModelCell.idCell)
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .black
        $0.separatorStyle = .none
        $0.isScrollEnabled = false
        return $0
    }(UITableView(frame: CGRect(x: 70, y: 530, width: view.frame.width - 140, height: view.frame.height / 3)))
    
    
    lazy private var exitBtn: UIButton = UIComponents.createButton(fontSize: 14, action: exitBtnAction, text: "Выход", bgColor: .bgCellGray,  titleColor: .white)
    
    lazy private var exitBtnAction: UIAction = UIAction { [weak self] sender in
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "auth"]))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewToView()
        setConstraints()
        setComponents()
        
    }
    
    func addSubviewToView() {
        [captionLabel, profileImage, emailLAbel, tableView, exitBtn].forEach {
            view.addSubview($0)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 84),
            captionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            emailLAbel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 50),
            emailLAbel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exitBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            exitBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            exitBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            exitBtn.heightAnchor.constraint(equalToConstant: 44)
          
        ])
    }
    
    func setComponents() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleSetRoot(nt: )), name: .setRoot, object: nil)
        captionLabel.text = "Мой профиль"
        emailLAbel.text = "Email пользователя"
        exitBtn.layer.cornerRadius = 5
        exitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    @objc
    private func handleSetRoot(nt: Notification) {
        if let userInfo = nt.userInfo, let email = userInfo["email"] as? String {
            self.emailLAbel.text = email
        }
    }

}

extension ProfileController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileModelCell.idCell, for: indexPath) as! ProfileTableCell
        cell.selectionStyle = .none
        cell.setupCell(cell: dataArray[indexPath.row])
       
        return cell
    }
    
    
}


extension ProfileController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    

}
