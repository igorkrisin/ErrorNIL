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
    var idEpisode: Int?
    var resultData: Results?
    var resultCharData: ResultsCharacter?
    
    var arrayCharacter: [String] = []
    var idCharacterArray: [Int] = []
    
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
        
        guard let resultData = resultData else { return }
        
        idCharacterArray = getIdCaracter(urlArr: resultData.characters)
        loadCharacterData()
    }
    
    func reloadTable() {
        collectionView.reloadData()
    }
    
    func getIdCaracter(urlArr: [String?]) -> [Int] {
        let regex = try! NSRegularExpression(pattern: #"(\d+)$"#)
        var result: [Int] = []
        for url in urlArr {
            if let url = url {
                if let match = regex.firstMatch(in: url, range: NSRange(url.startIndex..., in: url)) {
                    if let range = Range(match.range(at: 1), in: url) {
                        result.append(Int(url[range]) ?? 0)
                    }
                }
            }
        }
        return result
    }
    
    func createUrlWithImageId(idArr: [Int], url: String) -> [String] {
        var arrayUrl: [String] = []
        for ind in idArr {
            arrayUrl.append("\(url)/\(ind)")
        }
        return arrayUrl
        
    }
    
    func loadCharacterData() {
        
        let dispatchGroup = DispatchGroup()
        
        for id in idCharacterArray {
            dispatchGroup.enter()
            networkService.getCharacter(q: "", id: id) { item in
                DispatchQueue.main.async {
                    self.arrayCharacter.append(item.image ?? "")
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.reloadTable()
        }
        
       
    }
}

extension CharacterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCharacter.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseId, for: indexPath) as! CharacterCollectionViewCell
        let imageUrlString = arrayCharacter[indexPath.item]
        if let url = URL(string: imageUrlString) {
            cell.imageView.load(url: url)
        }
        cell.setupCell(item: arrayCharacter[indexPath.item])
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
