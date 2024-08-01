//
//  ContentView.swift
//  ObserverLesson
//
//  Created by Игорь Крысин on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewModel = AppViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(contentViewModel.nameSerias, id: \.id) { item in
                        Text(item.name ?? "")
                    }
                }
            }
            .onAppear{
                contentViewModel.getName(q: "")
            }
        }
    }
    
    @ViewBuilder
    func printContent(_ isLoggedIn: Bool = false) -> some View {
        if isLoggedIn { Text( "dffdf ")}
    }
    
    
    func someFunc(item: String) -> some View {
        HStack {
            if item == "2" {
                Text(item)
                    .font(.system(size: 25))
            } else if item == "3" {
                Text("ghbdtn")
            }
            EmptyView()
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func setBtn(bg: Color) -> some View {
        self.modifier(CustomBtnModifier(color: bg))
    }
}

struct CustomBtnModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}


