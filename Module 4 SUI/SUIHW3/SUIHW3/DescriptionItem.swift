//
//  DescriptionItem.swift
//  SUIHW3
//
//  Created by Игорь Крысин on 26.07.2024.
//

import SwiftUI

struct DescriptionItem: View {
    
    var item: DescriptionModel
    
    var currentDateString: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium // Выберите формат даты (medium, long, full и т.д.)
            formatter.timeStyle = .short // Выберите формат времени (short, medium, long и т.д.)
        return formatter.string(from: item.date) // Преобразуем текущую дату в строку
        }
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 7){
                Text(currentDateString)
                    .font(.system(size: 15, weight: .bold))
                    
                Text(item.comment)
                    .font(.system(size: 15, weight: .regular))
                
            }
            .frame(maxWidth: .infinity, alignment: Alignment(horizontal: .leading, vertical: .center))
            .padding(25)
            .background(.myBlack)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 20))
        }
        
    
    }
    
    
}

