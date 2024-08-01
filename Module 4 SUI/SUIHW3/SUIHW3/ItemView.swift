//
//  ItemView.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import SwiftUI

struct ItemView: View {
    
    var item: ItemModel
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(item.image)
                .resizable()
                .frame(width: 282, height: 518)
                .clipShape(.rect(cornerRadius: 20))
                .clipped()
                .scaledToFill()
            Button {
                print("point btn")
            } label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                    .padding(.trailing, 20)
            }

        }
    }
}


