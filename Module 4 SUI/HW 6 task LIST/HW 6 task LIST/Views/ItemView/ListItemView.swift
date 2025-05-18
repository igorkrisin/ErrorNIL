//
//  ItemView.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import SwiftUI

struct ListItemView: View {
    
    @Binding var task: TaskModel
    
    var body: some View {
        NavigationLink {
            ListTaskItemView(descrTask: "", task: $task)
        } label: {
           
            HStack{
                Image(systemName: task.isDone ? task.doneIcone : task.icon)
                    .foregroundStyle(.blue)
                VStack(alignment: .center, content: {
                    Text(task.name ?? "")
                    Image(task.image ?? "")
                        .resizable()
                        
                        .clipShape(.rect(cornerRadius:  20))
                        .frame(height: 300)
                        .clipped()
                        .scaledToFit()
                    
                        
                })
                
                
            }
        }
    }
}


