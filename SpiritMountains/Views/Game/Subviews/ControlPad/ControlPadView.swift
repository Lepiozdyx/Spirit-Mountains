//
//  ControlPadView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct ControlPadView: View {
    let onMove: (GameManager.Direction) -> Void
    
    var body: some View {
        VStack {
            ControlButton(direction: .up, onMove: onMove)
            
            HStack {
                ControlButton(direction: .left, onMove: onMove)
                
                // Spacer for center
                Color.clear
                    .frame(width: 60, height: 60)
                
                ControlButton(direction: .right, onMove: onMove)
            }
            
            ControlButton(direction: .down, onMove: onMove)
        }
    }
}

#Preview {
    ControlPadView(onMove: {_ in })
}
