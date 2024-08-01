//
//  DescriptionAppartItem.swift
//  Sui HW 4 Navigation
//
//  Created by Игорь Крысин on 28.07.2024.
//

import SwiftUI

struct DescriptionAppartItem: View {
    
    var itemModel: DescriptionAppartment
    
    var body: some View {
        VStack(alignment: .leading) {
      
                Text(itemModel.name)
                    .font(.system(size: 9, weight: .regular))
                    .foregroundStyle(.myGray)
                Text(itemModel.price)
                    .font(.system(size: 9, weight: .regular))
                    .foregroundStyle(.black)
            
        }
        .frame(minWidth: 82, minHeight:  43)
        .background(Color.myLightGray)
        .clipShape(.rect(cornerRadius: 6))
    }
}

//#Preview {
//    DescriptionAppartItem()
//}
