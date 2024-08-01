//
//  ContentView.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var itemsArray: [ItemModel] = ItemModel.mokeData()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
               
                HStack{
                    Button {
                        //
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 33))
                            .padding(.trailing, 45)
                        
                    }

                    VStack(alignment: .leading){
                        Text("16 декабря")
                            .foregroundStyle(.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        Text("2023 год")
                            .foregroundStyle(.white)
                        
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        
                        Image(.burgerMenu)
                            .resizable()
                            .frame(width: 30, height: 30)
                            
                    }
                    
                }
                .padding(.bottom, 63)
                ScrollView(.horizontal){
                    HStack(spacing: 30) {
                        ForEach(itemsArray){
                            ItemView(item: $0)
                        }
                    }
                    
                }
                
                HStack {
                    
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
    }
    
}

#Preview {
    ContentView()
}
