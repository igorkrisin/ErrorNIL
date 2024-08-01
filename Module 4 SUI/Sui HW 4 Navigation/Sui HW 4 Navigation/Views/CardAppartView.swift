//
//  CardAppartView.swift
//  Sui HW 4 Navigation
//
//  Created by Игорь Крысин on 29.07.2024.
//

import SwiftUI


struct CardAppartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var itemModel: TableItemModel
    var arrayItemModel = TableItemModel.mokeData()
    
    var image: String
    var name: String
    var price: String
    var description: String
    
    let rows = [
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .bottom){
                VStack {
                    ZStack(alignment: .topTrailing) {
                        Image(image)
                            .resizable()
                            .clipped()
                            .frame(height: 350)
                        HStack {
                            HStack(spacing: 15) {
                                Image(.less)
                                    .foregroundStyle(.white)
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Text("Back")
                                        .foregroundStyle(.white)
                                }
                            }
                            Spacer()
                            Button {
                                print("flagBtn pressed")
                            } label: {
                                Image(systemName: "bookmark")
                                    .resizable()
                                    .frame(width: 11, height: 13)
                                    .padding(9)
                                    .background(Color.white)
                                    .clipShape(.rect(cornerRadius: 6))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 65)
                    }
                }
                .ignoresSafeArea()
                .frame(maxWidth:  .infinity, maxHeight: .infinity, alignment: .top)
                ScrollView {
                    VStack(alignment: .leading){
                        VStack(alignment: .leading ,spacing: 17) {
                            Text(name)
                                .font(.system(size: 25, weight: .bold))
                            
                                .lineLimit(1)
                            Text(price)
                                .font(.system(size: 25, weight: .bold))
                            
                                .lineLimit(1)
                            Text(description)
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.myGray)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(itemModel.appartment, id: \.name) { appart in
                                        DescriptionAppartItem(itemModel: appart)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 43)
                        }
                        VStack(alignment: .leading ,spacing: 14) {
                            Text("Отделка квартир")
                                .font(.system(size: 25, weight: .bold))
                            LazyVGrid(columns: rows, spacing: 3) {
                               // ForEach(arrayItemModel, id: \.id) { item in
                                ForEach(itemModel.imageRoom, id: \.self) {
                                        Image($0)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(.rect(cornerRadius: 6))
                                    }
                                //}
                            }
                        }
                        .padding(.top, 32)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 35)
                }
                .frame(maxWidth: .infinity ,maxHeight:  geometry.size.height - 200, alignment: .topLeading)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                HStack {
                    Button {
                        print("order call btn pressed")
                    } label: {
                        Text("Order call")
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .background(.myLightGray)
                            .foregroundStyle(.blue)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    Spacer()
                    Button {
                        print("order call btn pressed")
                    } label: {
                        Text("Call")
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
                .frame(minHeight: 45)
                .padding(.bottom, 25)
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea(.all)
            .frame(maxWidth:  .infinity, maxHeight: .infinity, alignment: .top)
            .toolbar(.hidden, for: .automatic)
        }
    }
}

//#Preview {
//    CardAppartView()
//}
