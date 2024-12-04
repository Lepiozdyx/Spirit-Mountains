//
//  ControlButton.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct ControlButton: View {
    let direction: GameManager.Direction
    let onMove: (GameManager.Direction) -> Void
    
    private var imageName: String {
        switch direction {
        case .up: return "chevron.up"
        case .down: return "chevron.down"
        case .left: return "chevron.left"
        case .right: return "chevron.right"
        }
    }
    
    var body: some View {
        Button {
            onMove(direction)
        } label: {
            Image(systemName: imageName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)
                .frame(width: 60, height: 60)
                .background(.orange)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    ControlButton(direction: .up, onMove: {_ in })
}
