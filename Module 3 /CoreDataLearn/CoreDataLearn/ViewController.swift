//
//  ViewController.swift
//  CoreDataLearn
//
//  Created by Игорь Крысин on 08.07.2024.
//

import UIKit

class ViewController: UIViewController {

    private let coreManager = CoreManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        coreManager.deleteNote(id: "5C8FF0BB-7803-4CEA-B058-300270CDBC34")
        
        
        //print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
    }


}

