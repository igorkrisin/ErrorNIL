//
//  NoteViewController.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 14.06.2024.
//

import UIKit

class NoteViewController: UIViewController {
    
    private var  noteManager = NoteManager()
    
    var notes: [Note] = []
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame))
    
    
    lazy var barButton: UIBarButtonItem = {
        return $0
    }(UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(addBtnAction)))
    
    lazy private var alertController: UIAlertController = { alert in
        alert.addTextField { field in
            field.placeholder = "note"
            
        }
        
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: {[weak self] _ in
            let textField = alert.textFields?[0].text
            self?.noteManager.createNote(text: textField ?? "")
        }))
        return alert
    }(UIAlertController(title: "Записать заметку", message:  "Добавить новую заметку", preferredStyle: .alert))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        navigationItem.rightBarButtonItem = barButton
        view.addSubview(tableView)
        noteManager.getNote { [weak self] notes in
            guard let self = self else { return }
            self.notes = notes
            self.tableView.reloadData()
        }
       
    }
      
    @objc func addBtnAction() {
        present(alertController, animated: true)
    }
    
}

extension NoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].note
        
        return cell
    }
    
    
}
