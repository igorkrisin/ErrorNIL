//
//  ImageItemVM.swift
//  HW 5 Parse Jsone
//
//  Created by Игорь Крысин on 02.08.2024.
//

import SwiftUI

struct ImageItem: View {
    
    var networcService: NetworkProtocol = NetworkService()
    
    @Binding var searchText: String
    @Binding var arrayImage: [Results]
    
    
    
    var body: some View {
        VStack {
            
            ForEach(arrayImage) { image in
                VStack {
                    if let description = image.alt_description {
                        Text(description)
                            .font(.system(size: 25, weight: .bold))
                        Text(searchText)
                    } else {
                        Text("No description available")
                            .font(.system(size: 16, weight: .light))
                        
                    }
                    
                    if let urlString = image.urls?.small, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: .infinity, height: 300)
                                .clipped()
                                .clipShape(.rect(cornerRadius: 20))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        
        .onAppear{
            
            networcService.sendRequest(page: "1", query: searchText ) { item in
                DispatchQueue.main.async {
                    arrayImage = item
                    print(searchText)
                }
                
            }
        }
        
    }
}


