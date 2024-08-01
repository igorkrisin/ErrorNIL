//
//  MainVC.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 13.07.2024.
//

import UIKit

class MainVC: UIViewController {
    
    var selectedNote : Note?
    
    private let coreManager = CoreDataManager.shared
    
    var arrayMokeData: [MainCollectionModel] = MainCollectionModel.mokeData()
    
    var textFromTextField: ((String) -> Void)?
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
        $0.register(MainItem.self, forCellWithReuseIdentifier: MainItem.reusedId)
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 25
        $0.backgroundColor = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy private var moveToCreateNoteVCBtn: UIButton = {
        $0.setTitle("Add note", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        
        return $0
    }(UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 50), primaryAction: actionMoveToCreateNoteVC))
    
    lazy private var actionMoveToCreateNoteVC = UIAction { [weak self] _ in
        guard let self = self else { return }
        let cameraVc = CameraVC()
        navigationController?.pushViewController(cameraVc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Note"
        
        [collectionView, moveToCreateNoteVCBtn].forEach{
            view.addSubview($0)
        }
        collectionView.reloadData()
        //print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
        setConstraint()

    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
        ])
        
    }
    

}

extension MainVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coreManager.notes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainItem.reusedId, for: indexPath) as! MainItem
        //print("coreManager.notes[indexPath.row]:", coreManager.notes[indexPath.row].tag?.allObjects as? [Tag])
        guard let tags = coreManager.notes[indexPath.row].tag?.allObjects as? [Tag] else  { return cell }
        if  tags.count > 0 {
            let tag = tags[0]
            cell.setupCell(item: coreManager.notes[indexPath.row],tag: tag, folderName: selectedNote?.id ?? "")
            
        } else {
            
            cell.setupCell(item: coreManager.notes[indexPath.row],tag: nil, folderName: selectedNote?.id ?? "")
        }
       
        
        
        cell.completion = { [weak self] in
            guard let self = self else { return }
            self.selectedNote = self.coreManager.notes[indexPath.row]
            self.didTapAddTagButton()
        }
        
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

extension MainVC: UICollectionViewDelegate {
    
    // Add method to support swipe actions
    func collectionView(_ collectionView: UICollectionView, trailingSwipeActionsConfigurationForItemAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            self.coreManager.notes[indexPath.item].deleteNote()
            collectionView.deleteItems(at: [indexPath])
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MainVC: MainItemDelegate {
    func didTapAddTagButton() {
        let createTagVC = CreateTagVC()
        createTagVC.note = selectedNote
        
        if let sheet = createTagVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        
        present(createTagVC, animated: true, completion: nil)
    }
}
