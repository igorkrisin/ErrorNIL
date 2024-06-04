//
//  CharacterViewController.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 02.06.2024.
//

import UIKit

protocol CharacterVCProtocol: AnyObject {
    var networkService: NetworkProtocol { get set }
}


class CharacterViewController: UIViewController, CharacterVCProtocol {
    
    var networkService: NetworkProtocol = NetworService()
    var idForCell: Int?
    var resultData: Results?
    var resultCharData: [ResultsCharacter] = []
    
    var arrayCharacter: [String] = []
    
    lazy private var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 300)
        layout.minimumLineSpacing = 10
        $0.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseId)
        $0.dataSource = self
        
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy private var imageLabel: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 500)))
    
    lazy private var tableView: UITableView = {
        return $0
    }(UITableView())
    
    lazy private var listCharacters: [String] = resultData?.characters as! [String]

    override func viewDidLoad() {
        reloadTable()
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        networkService.getCharacter(q: "") { item in
            DispatchQueue.main.async {
                self.resultCharData = item
                self.reloadTable()
            }
        }
    }
    
    func reloadTable() {
        collectionView.reloadData()
    }
    
}

extension CharacterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(self.resultCharData)
        return resultCharData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseId, for: indexPath) as! CharacterCollectionViewCell
        
        cell.setupCell(item: resultCharData[indexPath.item])
        return cell
    }
}



extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
