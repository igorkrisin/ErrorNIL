//
//  ViewController.swift
//  HW13
//
//  Created by Игорь Крысин on 12.05.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    
    private lazy var tableDataArray = TableCell.createData()
    private lazy var dataFromModel = ViewModel.makeData()
    
    private lazy var captionLabel: UILabel = UIComponents.createLabel(fontSize: 30, weight: .black, color: .white, text: dataFromModel.mainCaption, numberofLines: 1)
    
    private lazy var backBtn: UIButton = UIComponents.createButton(image: "backArrow", width: 20, height: 20, action: btnBackAction)
    
    private lazy var mainDescription: UILabel = UIComponents.createLabel(fontSize: 20, weight: .bold,alignment: .center, color: .white , text: dataFromModel.mainDescripton, numberofLines: 0)
    
    private lazy var bottomDescription: UILabel = UIComponents.createLabel(fontSize: 14, weight: .light, color: .textOnBottomBtnGray, text: dataFromModel.footerDescription, numberofLines: 1)

    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .black
        $0.register(ItemTableCell.self, forCellReuseIdentifier: ItemTableCell.reuseId)
        return $0
    }(UITableView(frame: CGRect(x: 20, y: 245, width: view.frame.width - 40, height: 348)))
    
    private lazy var bottomView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = false
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var stackBtn: UIStackView = UIComponents.createStack(axis: .horizontal, aligment: .center, distribution: .equalSpacing, spasing: 5)
    
    private lazy var titleBtn: UILabel =  {
        let label = UIComponents.createLabel(fontSize: 20, weight: .bold, color: .black, text: "Далее", numberofLines: 1)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    @objc private func handleLabelTap() {
            print("Label tapped!")
        }

    private lazy var imageBtn: UIImageView = UIComponents.createImageView(image: "nextArrow", cornerRad: 0)
    
    private lazy var btnNext: UIButton = {

        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.addAction(btnNextAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var btnNextAction = UIAction { [weak self] action in
        print("btnNextAction btn")
    }
    
    private lazy var btnBackAction = UIAction { [weak self] action in
        print("btnBackAction btn")
    }
    
   
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubviewToView()
        setConstraint()
        
        captionLabel.font = .getUbuntuFont(fontType: .bold, size: 30)
        mainDescription.font = .getUbuntuFont(fontType: .bold, size: 20)
        bottomDescription.font = .getUbuntuFont(fontType: .regular, size: 14)
        
        
    }
    
  
//Family: Ubuntu Font names: ["Ubuntu-Regular", "Ubuntu-Italic", "Ubuntu-LightItalic", "Ubuntu-Medium", "Ubuntu-MediumItalic", "Ubuntu-Bold", "Ubuntu-BoldItalic"]
    
    func addSubviewToView() {
        
        [captionLabel, tableView, backBtn, mainDescription, bottomView].forEach {
            self.view.addSubview($0)
        }
        
        [bottomDescription, btnNext].forEach {
            bottomView.addSubview($0)
        }
        
        [titleBtn, imageBtn].forEach {
            stackBtn.addArrangedSubview($0)
        }
        
        btnNext.addSubview(stackBtn)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 87),
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            mainDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 154),
            mainDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66),
            bottomView.heightAnchor.constraint(equalToConstant: 60),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomDescription.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            bottomDescription.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 22),
//            bottomDescription.trailingAnchor.constraint(equalTo: stackBtn.trailingAnchor, constant: -21),
            
            btnNext.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            btnNext.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 18),
            //btnNext.leadingAnchor.constraint(equalTo: bottomDescription.trailingAnchor, constant: 41),
            btnNext.heightAnchor.constraint(equalToConstant: 23),
            
            stackBtn.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            stackBtn.centerYAnchor.constraint(equalTo: btnNext.centerYAnchor),
            stackBtn.leadingAnchor.constraint(equalTo: bottomDescription.trailingAnchor, constant: 20)
            
            
            
        ])
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableCell.reuseId, for: indexPath) as! ItemTableCell
        cell.setupCell(item: tableDataArray[indexPath.row])
        return cell
      
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        82
    }
}

