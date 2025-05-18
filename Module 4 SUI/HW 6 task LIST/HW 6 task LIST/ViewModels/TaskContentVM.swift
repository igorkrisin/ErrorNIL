//
//  TaskContentVM.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import Foundation


class TaskContentVM: ObservableObject {
    
    @Published var descriptionTaskArray: [ItemTaskModel] = []
    
    init () {
        getData()
        
        
    }
    
    func getData() {
        self.descriptionTaskArray = ItemTaskModel.mokeData()
        print("TaskContentVM:  ",descriptionTaskArray)
    }
    
    func deleteItemFromArray(task: ItemTaskModel) {
        for i in 0...descriptionTaskArray.count -  1 {
            if task.id == descriptionTaskArray[i].id {
                descriptionTaskArray.remove(at: i)
                break
            }
            
        }
    }
    
    func addItemForArray(description: String, data: Date) {
        descriptionTaskArray.insert(ItemTaskModel(date: data, description: description), at: 0)
        
    }
}
