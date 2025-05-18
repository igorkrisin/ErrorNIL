//
//  ImageItemVM.swift
//  HW 5 Parse Jsone
//
//  Created by Игорь Крысин on 02.08.2024.
//

import SwiftUI

struct ImageItem: View {
    
    
    var item: Results
    
    var body: some View {
        
        VStack {
            
            VStack (alignment: .leading){
                if let description = item.alt_description {
                    Text(description)
                        .font(.system(size: 25, weight: .bold))
                } else {
                    Text("No description available")
                        .font(.system(size: 16, weight: .light))
                    
                }
                
                if let urlString = item.urls?.thumb, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .clipShape(.rect(cornerRadius: 20))
                            .frame(height: 300)
                            .scaledToFill()
                    }
                    placeholder: {
                        ProgressView()
                    }
                }
            }
            
            
            
        }
        
    }
}


