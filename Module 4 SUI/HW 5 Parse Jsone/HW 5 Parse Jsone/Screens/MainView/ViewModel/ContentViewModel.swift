//
//  ContentViewModel.swift
//  HW 5 Parse Jsone
//
//  Created by Игорь Крысин on 03.08.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var arrayData: [Results] = []
    
    private let networkManager = NetworkService()
    
    func getPosts(page: String, q: String) {
        networkManager.sendRequest(page: page, query: q) { results in
            self.arrayData = results
        }
    }
}
