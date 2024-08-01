//
//  AppVieModel.swift
//  ObserverLesson
//
//  Created by Игорь Крысин on 31.07.2024.
//

import SwiftUI

class AppViewModel: ObservableObject {
    
    private let networkManager = ServiceManager()
    
    @Published var nameSerias: [Results] = []
    
    func getName(q: String) {
        networkManager.sendRequest(q: q) { [weak self] items in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.nameSerias = items
            }
        }
    }
}
