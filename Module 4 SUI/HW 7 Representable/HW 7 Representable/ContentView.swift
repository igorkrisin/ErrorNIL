//
//  ContentView.swift
//  HW 7 Representable
//
//  Created by Игорь Крысин on 08.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresent: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: -30) {
                GeometryReader { reader in
                    let minY = reader.frame(in: .global).minY
                    Image(.houses)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width)
                        .frame(height: 300 + (minY > 0 ? minY : 0))
                        .clipped()
                        .offset(y: -minY)
                }
                .frame(height: 300)
                
                VStack{
                    ForEach(0...30, id: \.self) {
                        Text($0.description)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.green)
                    }
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .frame(maxHeight: .infinity)
            
           
        }
        .ignoresSafeArea()
        HStack {
            Button {
                isPresent.toggle()
            } label: {
                Text("Push me")
                    .font(.system(size: 25))
                    .foregroundStyle(.black)
                    
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 20))
                    
            }
            .padding()
            .sheet(isPresented: $isPresent, content: {
                AlertController()
            })

        }
    }
}

#Preview {
    ContentView()
}
