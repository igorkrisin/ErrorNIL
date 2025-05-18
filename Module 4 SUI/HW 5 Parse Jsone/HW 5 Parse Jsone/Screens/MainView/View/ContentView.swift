//
//  ContentView.swift
//  HW 5 Parse Jsone
//
//  Created by Игорь Крысин on 01.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var nameImage: String = ""
    @StateObject var contentVM = ContentViewModel()

    
    //private var networcService: NetworkProtocol = NetworkService()
    
    
    var body: some View {
        VStack (spacing: 20) {
            Spacer(minLength: 20)   
            ZStack {
                TextField("entere image", text: $nameImage)
                    .padding(.leading, 10)
                    .frame(height: 50)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    
                    .clipped()
                    .onSubmit {
                        contentVM.getPosts(page: "2", q: nameImage) 
                    }
            }
            
            if contentVM.arrayData.isEmpty {
                VStack {
                    Text("Enter name for imge")
                    Text("Pictures will appear below")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .font(.system(size: 25))
            } else if nameImage.isEmpty {
                VStack {
                    Text("Enter name for imge")
                    Text("Pictures will appear below")
                }.onAppear{
                    contentVM.arrayData.removeAll()
                }
            }
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(contentVM.arrayData) { item in
                        ImageItem(item: item)
                        
                    }
                }
               
            }
     
            
           
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        
        .onAppear{
            contentVM.getPosts(page: "1", q: nameImage)
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
