//
//  ItemTable.swift
//  HW2Sui
//
//  Created by Игорь Крысин on 25.07.2024.
//

import SwiftUI

struct ItemTable: View {
    
    var item: ModelItemTable
    
    var body: some View {
        VStack (alignment: .leading){
            HStack() {
                Image(.profileImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 82)
                    .clipped()
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.userName)
                        .bold()
                        .font(.system(size: 20))
                    VStack(alignment: .leading, spacing: 12) {
                        Text(item.description)
                            .foregroundStyle(.gray)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        HStack {
                            Image(.clock)
                            Text(item.timeDescription)
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                        }
                        HStack {
                            Text(item.price)
                            Spacer()
                            Button {
                                print("appointment btn")
                            } label: {
                                Text("Appointment")
                                    .frame(height: 26)
                                    .frame(width: 126)
                                    .foregroundStyle(.white)
                                    .background(Color.blue)
                                    .clipShape(.capsule)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}


