//
//  AchievementItemView.swift
//  SpiritMountains
//
//  Created by Alex on 29.11.2024.
//

import SwiftUI

struct AchievementItemView: View {
    let item: AchievementItem
    
    var body: some View {
        HStack(spacing: 16) {
            // Achievement Icon
            Image(item.icon)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.db)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.blue, lineWidth: 2)
                        )
                )
            
            VStack(alignment: .leading, spacing: 4) {
                // Achievement Title
                Text(item.title)
                    .customFont(18, .white)
                
                // Progress Text
                Text("\(item.progress)/\(item.total)")
                    .customFont(16, .white)
            }
            
            Spacer()
        }
    }
}

#Preview {
    AchievementItemView(item: .init(icon: .symbol, title: "QWeRTY", progress: 5, total: 100))
        .padding()
        .background(Color.db.opacity(0.5))
}
