//
//  SpiritView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct SpiritView: View {
    let type: SpiritType
    
    var body: some View {
        Group {
            switch type {
            case .water:
                Image(.water)
                    .resizable()
                    .frame(width: 30, height: 32)
            case .fire:
                Image(.fire)
                    .resizable()
                    .frame(width: 30, height: 32)
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SpiritView(type: .water)
        SpiritView(type: .fire)
    }
}
