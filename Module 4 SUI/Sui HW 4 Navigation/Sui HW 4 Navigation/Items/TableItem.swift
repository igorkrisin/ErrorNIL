//
//  TableItem.swift
//  Sui HW 4 Navigation
//
//  Created by Игорь Крысин on 28.07.2024.
//

import SwiftUI

struct TableItem: View {
    
    var itemModel: TableItemModel
    
     //var arrayData: [TableItemModel] = TableItemModel.mokeData()
    
    
    
    var body: some View {
        VStack(spacing: 13) {
            NavigationLink {
                CardAppartView(itemModel: itemModel, image: itemModel.image, name: itemModel.name, price: itemModel.price, description: itemModel.description)
            } label: {
                ZStack(alignment: .topTrailing) {
                    Image(itemModel.image)
                        .resizable()
                    
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 185)
                        .clipShape(.rect(cornerRadius: 15))
                        .clipped()
                    Button {
                        print("flagBtn pressed")
                        //print(arrayData)
                    } label: {
                        Image(systemName: "bookmark")
                            .resizable()
                            .frame(width: 11, height: 13)
                            .padding(9)
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 6))
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                        
                    }
                    
                }
            }
            VStack(alignment: .leading, spacing: 13){
                Text(itemModel.name)
                    .font(.system(size: 22, weight: .bold))
                Text(itemModel.price)
                    .font(.system(size: 22, weight: .bold))
                Text(itemModel.description)
                    .font(.system(size: 14, weight: .light))
                    .foregroundStyle(.myGray)
                ScrollView(.horizontal) {
                    HStack {
                        //ForEach(arrayData, id: \.id) { item in
                           
                            ForEach(itemModel.appartment, id: \.name) { appart in
                                DescriptionAppartItem(itemModel: appart)
                            }
                        }
                    //}
                }
                .frame(maxWidth: .infinity, maxHeight: 43)
                
            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
        }
        .padding(.bottom, 26)
        .clipShape(.rect(cornerRadius: 15))
        
        
    }
    
}

#Preview {
    ContentView()
}
