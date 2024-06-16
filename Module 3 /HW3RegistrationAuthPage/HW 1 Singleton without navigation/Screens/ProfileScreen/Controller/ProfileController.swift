//
//  ProfileController.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 26.05.2024.
//

import UIKit
import SDWebImage

class ProfileController: UIViewController {
    
    
    private let appModel: AppModel = AppModel()
    private var dataArray = ProfileModelCell.makeTableData()
    private let profileManagerFireBAseManager = ProfileFireBaseManager()
    
    lazy private var captionLabel: UILabel = UIComponents.createLabel(fontSize: 35, weight: .regular, color: .white, numberofLines: 1)
    
    lazy private var tapImage = UITapGestureRecognizer(target: self, action: #selector(tapToImage))
    
    lazy private var imagePicker: UIImagePickerController = {
        $0.delegate = self
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
        return $0
    }(UIImagePickerController())
    
    
    
    lazy private var profileImage: UIImageView = {
        //$0.image = UIImage(resource: .profile)
        //$0.backgroundColor = .clear
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.addGestureRecognizer(tapImage)
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView(frame: CGRect(x: view.frame.midX - 75, y: 200, width: 150, height: 150)))
    
    @objc
    func tapToImage() {
        print(1)
        present(imagePicker, animated: true)
    }
    
    
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
        guard let self = self else { return }
        
        self.appModel.logOut()
        
        NotificationCenter.default.post(Notification(name: .setRoot, userInfo: ["vc": "auth"]))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileManagerFireBAseManager.loadavatarUrl { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let url):
                self.profileImage.sd_setImage(with: url, placeholderImage: .profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
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
            captionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
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
//        NotificationCenter.default.addObserver(self, selector: #selector(handleSetRoot(nt: )), name: .setRoot, object: nil)
        captionLabel.text = "Мой профиль"
        emailLAbel.text = Service.shared.email
        exitBtn.layer.cornerRadius = 5
        exitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private func handleCellTap(at index: Int) {
        switch index {
        case 0:
            let noteVc = NoteViewController()
            navigationController?.pushViewController(noteVc, animated: true)
        case 1:
            print(1)
        default:
            print(2)
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
        cell.setupCell(cell: dataArray[indexPath.row], tag: indexPath.row)
        cell.didTapCell = { [weak self] in
            self?.handleCellTap(at: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = dataArray[indexPath.row]
        print("selCell: ",selectedCell)
    }
    
    
}


extension ProfileController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    

}


extension ProfileController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.profileImage.image = image
            if let  imageData = image.jpegData(compressionQuality: 0.1) {
                self.profileManagerFireBAseManager.uploadImage(imageData: imageData)
            }
        }
        picker.dismiss(animated: true)
    }
}
