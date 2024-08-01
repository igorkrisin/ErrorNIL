//
//  BtnItemView.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import SwiftUI

struct BtnItemView: View {
    var item: ButtonModel
    
    var body: some View {
        Button {
            print("tag btn")
        } label: {
            Text(item.nameBtn)
                .frame(maxHeight: 34)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.gray)
                .clipShape(.capsule)
                .foregroundStyle(Color.white)
            
        }

    }
}

