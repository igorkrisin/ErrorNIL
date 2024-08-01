//
//  ContentView.swift
//  HW2Sui
//
//  Created by Игорь Крысин on 21.07.2024.
//

import SwiftUI

struct ContentView: View {
    var items  = ModelItemTable.mokeData()
    
    @State private var specialistName = ""
    @State private var searchText = ""
    
    var body: some View {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: {
                                print("burger menu")
                            }, label: {
                                Image(.burgerBtn)
                            })
                            Spacer()
                            Button(action: {
                                print("profile")
                            }, label: {
                                Image(.profileImg)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .scaledToFill()
                                    .clipShape(.circle)
                            })
                        }
                        VStack(alignment: .leading,spacing: 14){
                            Text("Hello User")
                                .fontWeight(.heavy)
                                .font(.system(size: 16))
                            Text("Find your specialist")
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                        }
                        .padding(.top, 31)
                        VStack{
                            ZStack(alignment: .trailing) {
                                TextField("search", text: $specialistName)
                                    .frame(height: 60)
                                    .customTextField("magnifyingglass", isButton: true, colorButton: Color("colorButtonPaperplane"), searchText: $searchText)
                                    .clipShape(.capsule)
                                Button {
                                    print("send button")
                                } label: {
                                    Image(systemName: "paperplane.circle.fill")
                                        .resizable()
                                        .frame(width: 47, height: 47)
                                        .padding(.trailing, 5)
                                        .rotationEffect(.degrees(45))
                                        .foregroundStyle(.blue)
                                }
                            }
                            .padding(.bottom, 48)
                        }
                        .padding(.top, 30)
                    }
                    VStack (alignment: .leading, spacing: 40){
                        
                        HStack (spacing: 17){
                            makeButton(text: "Place", image: .pointMap, colorBG: Color.blue)
                            makeButton(text: "Phone", image: .phone3, colorBG: Color.green)
                            makeButton(text: "User", image: .person4, colorBG: Color.orange)
                        }
                        HStack {
                            Text("Top Doctor")
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                            Spacer()
                            Button {
                                print("see all")
                            } label: {
                                Text("See all")
                                    .font(.system(size: 14))
                            }
                        }
                    }
                    ScrollView(.vertical) {
                        ForEach(items) {
                            ItemTable(item: $0)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .background(Color.mylightGray)
        }
    }
    
    func makeButton(text: String, image: ImageResource, colorBG: Color) -> some View {
        Button {
            print("person btn")
        } label: {
            VStack {
                Image(image)
                Text(text)
                    .foregroundStyle(Color.white)
            }
            
            
        }
        .frame(width: 112, height: 112)
        .background(colorBG)
        .clipShape(.rect(cornerRadius: 22))
    }
}

#Preview {
    ContentView()
}



