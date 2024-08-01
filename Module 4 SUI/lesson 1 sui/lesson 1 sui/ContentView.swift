//
//  ContentView.swift
//  lesson 1 sui
//
//  Created by Игорь Крысин on 19.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack( spacing: 17){
                Image(.img1)
                    .resizable()
                    .frame(height: 249)
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 20))
                ScrollView(.horizontal){
                    HStack(spacing: 14) {
                        Image(.img3)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                        Image(.img3)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                        Image(.img3)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                        Image(.img3)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
            }
            VStack(alignment: .leading, spacing: 28){
                HStack(spacing: 10) {
                    Image(.icon)
                        .frame(width: 28)
                    Text("User Name")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    Spacer()
                    Image(.image2)
                    Text("25")
                }
                .padding(.top, 43)
                
                VStack(alignment: .leading) {
                    Text("About")
                        .fontWeight(.light)
                        .foregroundStyle(Color.gray)
                    Spacer()
                    Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod")
                    
                        .fontWeight(.regular)
                }
            }
        }
        .padding(.horizontal, 20)
        Button(action: {
            print(1)
        }, label: {
            Text("Settings profile")
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 20)
        })
    }
}

#Preview {
    ContentView()
}
