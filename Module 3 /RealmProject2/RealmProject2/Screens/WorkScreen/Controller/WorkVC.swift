//
//  WorkVC.swift
//  RealmProject2
//
//  Created by Игорь Крысин on 27.06.2024.
//

import UIKit

class WorkVC: UIViewController {
    
    var titleData: String = ""
    
    private var arrayItem: [WorkModel] = WorkModel.mokeData()
    var folder: FolderModelRealm?
    
    lazy private var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize(width: view.frame.width - 60, height: 175)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        $0.dataSource = self
        $0.delegate = self
        $0.register(WorkItem.self, forCellWithReuseIdentifier: WorkItem.reusedId)
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 150), collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy private var addTextBtn: UIButton = {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25
        $0.tintColor = .white
        $0.addAction(addTextBtnAction, for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(x: view.frame.width - 80, y: view.frame.height - 120, width: 50, height: 50)))
    
    lazy private var addTextBtnAction = UIAction { [weak self ] action in
        guard let self = self else { return }
        let addDataVC = AddDataVC()
        addDataVC.folder = folder
        navigationController?.pushViewController(addDataVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = titleData
        [collectionView, addTextBtn].forEach {
            view.addSubview($0)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    
}

extension WorkVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        folder?.notes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkItem.reusedId, for: indexPath) as! WorkItem
        
        cell.setupCell(item: folder?.notes[indexPath.row], folderName: folder?.name ?? "")
        
        return cell
    }
    
}
