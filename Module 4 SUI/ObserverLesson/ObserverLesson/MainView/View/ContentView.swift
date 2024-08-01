//
//  ContentView.swift
//  ObserverLesson
//
//  Created by Игорь Крысин on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appVM: AppViewModel
    
    var items: [String] = ["1", "2", "3"]
    
    var body: some View {
        VStack {
            Text("first")
            Button {
                appVM.isInOnline = false
            } label: {
                Text("Next view")
            }
            NavigationLink {
                ThirdView()
                   
            } label: {
                Text("3rd view")
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


