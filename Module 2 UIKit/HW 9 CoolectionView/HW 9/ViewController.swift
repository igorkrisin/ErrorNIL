//
//  ViewController.swift
//  HW 9
//
//  Created by Игорь Крысин on 24.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var arrayItem: [Item] = Item.makeDataObj()

    
    lazy private var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        $0.dataSource = self
        $0.delegate = self
        $0.register(CardItem.self, forCellWithReuseIdentifier: CardItem.reuseId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayItem.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItem.reuseId, for: indexPath) as! CardItem
        
        cell.setupCell(item: arrayItem[indexPath.item])
        
        
        return cell
    }
    
    
}
