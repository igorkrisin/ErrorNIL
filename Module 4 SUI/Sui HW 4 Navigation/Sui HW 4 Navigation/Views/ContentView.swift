//
//  ContentView.swift
//  Sui HW 4 Navigation
//
//  Created by Игорь Крысин on 28.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var arrayData: [TableItemModel] = TableItemModel.mokeData()
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("\(arrayData.count) предложений")
                    .padding(.leading, 20)
                ScrollView {
                    VStack {
                        ForEach(arrayData, id: \.id) {
                            TableItem(itemModel: $0)
                        }
                        
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    ContentView()
}
