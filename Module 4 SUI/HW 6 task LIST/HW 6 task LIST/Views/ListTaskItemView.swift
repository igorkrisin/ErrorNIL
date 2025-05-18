//
//  TaskItemView.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import SwiftUI

struct ListTaskItemView: View {
    
    @State var descrTask: String
    @State private var isSheetPresented = false
    
    @Binding var task: TaskModel
    @StateObject var viewModel = TaskContentVM()
    
    var body: some View {
        VStack {
            VStack {
                Text(task.name ?? "")
            }
            ZStack (alignment: .bottomTrailing) {
                Form {
                    
                    ForEach($viewModel.descriptionTaskArray) { item in
                        TaskItemView(task: $task, description: item, taskVM: viewModel)
                        
                        
                        
                    }
                    .onAppear{
                        print("TaskItemVM: ", viewModel.descriptionTaskArray)
                    }
                }
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "plus")
                        .padding(30)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Circle())
                        .padding(20)
                }
                .sheet(isPresented: $isSheetPresented, content: {
                    SheetView(textDescript: $descrTask)
                        .environmentObject(viewModel)
                })

            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}


