//
//  WebPage.swift
//  HW 7 Representable
//
//  Created by Игорь Крысин on 12.08.2024.
//

import SwiftUI

struct WebPage: View {
    @State var isLoad: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            WebKitView(isLoad: $isLoad)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                if isLoad {
                    Text("loaded")
                        .frame(height: 100)
                        .padding(.top, 20)
                } else {
                    Text("loading")
                        .frame(height: 100)
                        .padding(.top, 20)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WebPage()
}
