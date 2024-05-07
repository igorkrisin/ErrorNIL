//
//  DescriptionViewController.swift
//  HW 6
//
//  Created by Игорь Крысин on 14.04.2024.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    lazy var mainImage = item?.mainImage
    
    var item: Item?
    
    lazy var listImage: [String] = item?.listImage ?? []
    
    
    lazy var mainLabel: UILabel = {
        $0.text = item?.nameLabel
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        $0.frame  = CGRect(x: 25, y: 84, width: view.frame.width - 50, height: 44)
        return $0
    }(UILabel())
    
    lazy var mainImageView: UIImageView = {
        $0.image = UIImage(named: mainImage ?? "")
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: 153, width: view.frame.width - 60, height: 189)))
    
    lazy var descripionImage: UILabel =  {
        $0.text = item?.description
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.numberOfLines = 3
        return $0
    }(UILabel(frame: CGRect(x: 30, y: 360, width:  view.frame.width - 60, height: 67)))
    
    lazy var photoLabel: UILabel = {
        $0.text = "Фотографии"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return $0
    }(UILabel(frame: CGRect(x: 30, y: 450, width: view.frame.width - 60, height: 24)))
    
    lazy var tableView: UITableView = {
        $0.frame.size = CGSize(width: view.frame.width, height: view.frame.height / 2 - 60)
        $0.frame.origin = CGPoint(x: 0, y: 496)
        return $0
    }(UITableView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: "cellDescription")
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .white
        [mainLabel, mainImageView, descripionImage, photoLabel, tableView].forEach {
            view.addSubview($0)
        }
       
    }

}

extension DescriptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDescription", for: indexPath) as! DescriptionTableViewCell
        
        cell.setupCell(nameImage: listImage[indexPath.row])
        
        
        
        return cell
    }
}

extension DescriptionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        226
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageViewController()
        vc.imageName = listImage[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
