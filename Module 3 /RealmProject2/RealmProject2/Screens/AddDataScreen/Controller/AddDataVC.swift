//
//  AddDataVC.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 01.07.2024.
//

import UIKit

class AddDataVC: UIViewController {
    
    var folder: FolderModelRealm?
    let realmManager = RealmManager()
    let storageManager = StorageManager()
    
    private lazy var imagePicker: UIImagePickerController = {
        $0.delegate = self
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
        return $0
    }(UIImagePickerController())
    
    lazy private var textField: UITextField = {
        $0.placeholder = "Заголовок"
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        $0.leftViewMode = .always
        return $0
    }(UITextField(frame: CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 50)))
    
    lazy private var textView: UITextView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        return $0
    }(UITextView(frame: CGRect(x:20, y: 220, width: view.frame.width - 40, height: 160)))
    
    lazy private var loadImageBtn: UIButton = {
        $0.setTitle("Загрузить фото", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: view.center.x - 100, y: 400, width: 200, height: 30), primaryAction: loadImage))
    
    lazy var loadImage = UIAction {[weak self]_ in
        guard let self else {return}
        present(imagePicker, animated: true)
    }
    
    lazy private var saveImageBtn: UIButton = {
        $0.setTitle("Coхранить", for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.addAction(saveAction, for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 50)))
    
    lazy var saveAction = UIAction {[weak self] _ in
        
        guard let self = self else { return }
        
        let headerText = textField.text
        let contentText = textView.text
        
        let note = NoteModel()
        note.captionName = headerText ?? ""
        note.descriptionName = contentText ?? ""
        
        
        
        if let img = imageView.image {
            
            
            if let imgData = img.jpegData(compressionQuality: 1) {
                let folderName = folder?.name ?? ""
                let imageName = UUID().uuidString + ".jpeg"
                storageManager.saveImage(folder: folderName, imageName: imageName, image: imgData)
                note.image = imageName
            }
            
        }
        realmManager.createNote(folderId: folder?.id, note: note)
        
        // image manager
    }
    
    lazy private var imageView: UIImageView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView(frame: CGRect(x: 20, y: 450, width: view.frame.width - 40, height: 227)))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Добавить"
        [textField, textView, loadImageBtn, saveImageBtn, imageView].forEach {
            view.addSubview($0)
        }
    }

}

extension AddDataVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
