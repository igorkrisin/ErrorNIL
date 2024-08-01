//
//  CreateNoteVC.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 13.07.2024.
//

import UIKit

class CreateNoteVC: UIViewController {
    
    private let coreManager = CoreDataManager.shared
    private var note: Note?
    
    let storageManager = StorageManager()
    
    var image: UIImage?
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return $0
        
    }(UIImageView(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 500)))
    
    private lazy var descriptionTextField: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5150558775)
        $0.placeholder = "Add description for image"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 2))
        $0.leftViewMode = .always
        $0.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.delegate = self
        return $0
    }(UITextField(frame: CGRect(x: 20, y: view.frame.height - 240, width: view.frame.width - 40, height: 50)))
    
    
    
    private lazy var saveNotesBtn: UIButton = {
        $0.setTitle("Save note", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 50), primaryAction: actionSaveNotesBtn))
    
    private lazy var actionSaveNotesBtn = UIAction { [weak self] _ in
        guard let self = self else { return }
        
        
        if let img = imageView.image {
            
            if let data = img.jpegData(compressionQuality: 1) {
                let imageName = UUID().uuidString + ".jpeg"
                let folder = note?.id ?? ""
                storageManager.saveImage(folder: folder, imageName: imageName, image: data)
                
                note?.image = imageName
                print("imageName: ", imageName)
                coreManager.createNote(name: descriptionTextField.text ?? "", image: imageName)
            }
     
        }
        
        
        
        
        
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
        mainVC.collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [imageView, descriptionTextField, saveNotesBtn].forEach {
            view.addSubview($0)
        }
        
        imageView.image = image
         
    }
    

}


extension CreateNoteVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}




