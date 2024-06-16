//
//  ViewController.swift
//  MyParseJson
//
//  Created by Игорь Крысин on 28.05.2024.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    var networkService: NetworkProtocol { get set }
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    var networkService: NetworkProtocol = NetworService()
    
    var resultsData: [Results] = []
    
    lazy private var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.reuseId)
        return $0
    }(UITableView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100)))
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Rick and Morty Episodes"
        view.addSubview(tableView)
        view.backgroundColor = .white
        networkService.sendRequest(q: "") { item in
            DispatchQueue.main.async {
                self.resultsData = item
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.reuseId, for: indexPath) as! EpisodeCell
        cell.setupCell(item: resultsData[indexPath.row])
        
        let item = resultsData[indexPath.row]
        cell.completion = {
            let vc = CharacterViewController()
            vc.resultData = item
            vc.idEpisode = self.resultsData[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
