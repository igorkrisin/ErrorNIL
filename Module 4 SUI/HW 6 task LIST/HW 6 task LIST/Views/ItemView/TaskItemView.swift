//
//  TaskItemView.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 05.08.2024.
//

import SwiftUI

struct TaskItemView: View {
    
    @Binding var task: TaskModel
    @Binding var description: ItemTaskModel
    
    
    @StateObject var taskVM: TaskContentVM
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(description.description)
                .font(.system(size: 20, weight: .regular))
            HStack {
                Button {
                    task.isDone.toggle()
                } label: {
                    Image(systemName: "checkmark.circle")
                }
                .padding(.horizontal, 10)
                .buttonStyle(BorderlessButtonStyle())
                Text("\(description.date)")
                    .font(.system(size: 16, weight: .light))
                Spacer()
                

                Button {
                  
                    taskVM.deleteItemFromArray(task: description)
                } label: {
                    Image(systemName: "trash")
                }
                .buttonStyle(BorderlessButtonStyle())
                
            }
        })
    }
}


