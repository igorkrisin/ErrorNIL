
import UIKit



class MainViewController: UIViewController {
    
    //lazy var secondNameLabel: UILabel = createLabel(text: "Фамилия", frame: CGRect(x: 170, y: 130, width: 111, height: 19))
    
    lazy var editButton: UIButton = createButton(text: "Редактировать", frame: CGRect(x: 134, y: 156, width: 147, height: 30), background: .blue, cornerRadius: 10, action: moveToEditViewAction)
    
    lazy var descriptionData: UITextView = {
        $0.text = ""
        return $0
    } (UITextView())
    
    lazy var myView: UIView = {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 30
        return $0
    }(UIView(frame: CGRect(x: 30, y: 101, width: view.frame.width - 60, height: 110)))
    
    lazy var profilePhoto: UIImageView = {
        $0.image = .profilePhoto
        return $0
    } (UIImageView(frame: CGRect(x: 47, y: 119, width: 75, height: 75)))
    
    lazy var nameLabel: UILabel =  {
        $0.text = "Имя Фамилия"
        return $0
    }(UILabel(frame: CGRect(x: 134, y: 130, width: 111, height: 19)))
    
    lazy var btnToDescriptionVC = {
            $0.setImage(.moveToDescriptionVCBtn, for: .normal)
        $0.addTarget(self, action: #selector(moveToDescriptionVC), for: .touchUpInside)
            //$0.frame(forAlignmentRect: CGRect(x: view.frame.width - 47 - 17, y: 148, width: 17, height: 17))
            return $0
        }(UIButton(frame: CGRect(x: view.frame.width - 47 - 17, y: 148, width: 17, height: 17)))
    
    
    private lazy var moveToEditViewAction = UIAction { [weak self] action in
        let editVC = EditViewController()
        editVC.onUpdateName = { [weak self] text, text2 in
            guard let self else { return }
            nameLabel.text = ("\(text) \(text2)")
        }
//        editVC.onUpdateSecondName = { [weak self] text in
//            guard let self else { return }
//            secondNameLabel.text = text
//        }
        editVC.onUpdateTextView = { [weak self] text in
            guard let self else { return }
            descriptionData.text = text
        }
        self?.navigationController?.pushViewController(editVC, animated: true)
    }
    
    private lazy var moveToDescriptionAction = UIAction { [ weak self] action in
        let editVC = DescriptionViewController()
        self?.navigationController?.pushViewController(editVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Главная"
        view.backgroundColor = .white
        [myView, profilePhoto, nameLabel, editButton, btnToDescriptionVC].forEach {
            view.addSubview($0)
        }
    }

    
    private func createLabel(text: String, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.font = UIFont(name: "Inter", size: 16)
        label.text = text
        return label
    }
    
    private func createButton(text: String, frame: CGRect, background: UIColor, cornerRadius: CGFloat, action: UIAction) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(text, for: .normal)
        button.backgroundColor = background
        button.layer.cornerRadius = cornerRadius
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    
    @objc func moveToDescriptionVC() {
        let descriptionVC = DescriptionViewController()
        descriptionVC.nameLabel.text = "\(nameLabel.text! ?? "")"
        //descriptionVC.secondNameLabel.text = secondNameLabel.text
        descriptionVC.descriptionTextView = descriptionData.text
        descriptionVC.titleDescrVc = "\(nameLabel.text! ?? "")"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
   
  
    

  
}



