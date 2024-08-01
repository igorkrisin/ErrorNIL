//
//  ContentView.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var itemsArray: [ItemModel] = ItemModel.mokeData()
    var btnArray: [ButtonModel] = ButtonModel.mokeDate()
    var arrayDescroption: [DescriptionModel] = DescriptionModel.mokeData()
    
    @State private var specialistName = ""
    
    var body: some View {
        VStack {
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
                    .padding(.horizontal, 20)
                    ScrollView(.horizontal){
                        HStack(spacing: 30) {
                            ForEach(itemsArray){
                                ItemView(item: $0)
                            }
                        }
                        
                    }
                    .padding(.bottom, 32)
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(btnArray) {
                                BtnItemView(item: $0)
                            }
                        }
                    }
                    .padding(.bottom, 65)
                    VStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit")
                            .foregroundStyle(.white)
                            .padding(25)
                            .background(Color.myBlack)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    .padding(.bottom, 40)
                    VStack(spacing: 14) {
                        ForEach(arrayDescroption) {
                            DescriptionItem(item: $0)
                        }
                    }
                    
                }
                //.padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
            .background(Color.myDarkGray.edgesIgnoringSafeArea(.all))
            
            ZStack(alignment: .trailing) {
                TextField("Add comment", text: $specialistName)
                
                
                    .padding(.vertical, 30)
                    .padding(.horizontal, 20)
                    .padding(.trailing, 60)
                    .background(.white)
                    .frame(height: 60)
                    .clipShape(.capsule)
                
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 47, height: 47)
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                        .rotationEffect(.degrees(45))
                        .foregroundStyle(.myDarkGray)
                }

                
                
            }
            .padding(.horizontal, 10)
        }
        .background(.myDarkGray)
        
        
    }
    
}

#Preview {
    ContentView()
}
