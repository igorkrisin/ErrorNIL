//
//  CreateTagVC.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 16.07.2024.
//

import UIKit

class CreateTagVC: UIViewController {
    
    var coreManager = CoreDataManager.shared
    
    var onTextPass: ((String)-> ())?
    
    var note: Note?

    private lazy var tagTextField: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5150558775)
        $0.placeholder = "Add tag for image"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 2))
        $0.leftViewMode = .always
        $0.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.delegate = self
        return $0
    }(UITextField(frame: CGRect(x: 20, y:  180, width: view.frame.width - 40, height: 50)))
    
    private lazy var saveTagBtn: UIButton = {
        $0.setTitle("Save note", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 20, y: view.frame.height - 500, width: view.frame.width - 40, height: 50), primaryAction: actionSaveNotesBtn))
    
    private lazy var actionSaveNotesBtn = UIAction { [weak self] _ in
        guard let self = self else { return }
    
        coreManager.addTag(name: tagTextField.text ?? "", note: note!)
        
        
        dismiss(animated: true)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tagTextField)
        view.addSubview(saveTagBtn)
        
    }

}


extension CreateTagVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
