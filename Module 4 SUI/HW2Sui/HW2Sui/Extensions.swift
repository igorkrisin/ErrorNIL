//
//  Extensions.swift
//  HW2Sui
//
//  Created by Игорь Крысин on 22.07.2024.
//

import Foundation
import SwiftUI


public extension View {
    @ViewBuilder
    
    func customTextField (
        _ icon: String? = nil,
        _ paddingTop: CGFloat = 0,
        _ paddingBottom: CGFloat = 0,
        isButton: Bool = false,
        colorButton: Color = .blue,
        searchText: Binding<String>
    ) -> some View {
        HStack {
            if let icon {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            
            self
            
            if isButton {
                Spacer()
                Button {
                    print("search btn")
                } label: {
                    Image("paperplane.circle.fill")
                        .font(.title)
                        .background(colorButton)
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(45))
                    
                }
                
            }
            
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .background(.bar, in: .capsule)
        .padding(.top, paddingTop)
        .padding(.bottom, paddingBottom)
        .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
        .listRowSeparator(.hidden )
        .symbolRenderingMode(.hierarchical)
        
        
    }
}
