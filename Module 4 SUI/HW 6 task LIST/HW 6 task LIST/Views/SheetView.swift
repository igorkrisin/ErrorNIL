//
//  SheetView.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//

import SwiftUI

struct SheetView: View {
    
    @Binding var textDescript: String
    @EnvironmentObject var taskContentVM: TaskContentVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { reader in
            VStack (spacing: 50) {
               
                ZStack(alignment: .center) {
                   
                    TextEditor(text: $textDescript)
                        .padding(5)
                        .frame(height: 200, alignment: .top)
                        .clipped()
                        .shadow(radius: 10)
                    if textDescript.isEmpty {
                        Text("Enter your description")
                            .font(.system(size: 16, weight: .light))
                    }
                }
                
                
                HStack {
                    Button {
                        taskContentVM.addItemForArray(description: textDescript, data: Date.now)
                        textDescript = ""
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .frame(width: reader.size.width / 2 - 10, height: 50)
                    
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 10))
                    
                    
                    
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .frame(width: reader.size.width / 2 - 10 ,height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    
                }
                
            }
            .frame(alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 20)
        .padding(.top, 50)
        
    }
}

//#Preview {
//    // Используем @State для создания привязки
//    @State var text = ""
//    return SheetView(textDescript: $text)
//}


