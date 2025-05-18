//
//  ListContentVM.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import SwiftUI

class ListContentVM: ObservableObject {
    
    @Published var taskArray: [TaskModel] = []
    
    init() {
        getData()
    }
    
    
    
    private func getData() {
        self.taskArray = TaskModel.mokeData()
    }
    
 
}
