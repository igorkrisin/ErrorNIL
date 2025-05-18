//
//  ContentView.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import SwiftUI

struct ListContentView: View {
    
    @StateObject var viewModel = ListContentVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.taskArray) { item in
                    ListItemView(task: item )
                        .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 30
                                                  , trailing: 5))
                        .listRowSeparator(.hidden)
                    
                }
            }
            .listStyle(PlainListStyle())

        }
    }
}

#Preview {
    ListContentView()
}



