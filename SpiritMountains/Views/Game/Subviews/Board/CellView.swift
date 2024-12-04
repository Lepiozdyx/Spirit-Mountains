//
//  CellView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct CellView: View {
    let type: CellType
    let hasSpirit: Bool
    let spiritType: SpiritType
    
    var body: some View {
        ZStack {
            // Cell background
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black.opacity(0.5), lineWidth: 2)
                )
            
            // Switcher icon
            if case .switcher = type {
                Image(.elementSwitcher)
                    .resizable()
                    .frame(width: 26, height: 30)
            }
            
            // Spirit
            if hasSpirit {
                SpiritView(type: spiritType)
                    .transition(.scale)
                    .animation(.easeInOut, value: hasSpirit)
            }
        }
    }
    
    private var backgroundColor: Color {
        switch type {
        case .water(let filled):
            return filled ? .blue : .blue.opacity(0.3)
        case .fire(let filled):
            return filled ? .orange : .orange.opacity(0.3)
        case .switcher:
            return .black.opacity(0.7)
        }
    }
}

#Preview {
    CellView(type: .water(filled: false), hasSpirit: false, spiritType: .fire)
        .padding(50)
}
