//
//  BoardView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct BoardView: View {
    let board: GameBoard
    let spirit: Spirit
    
    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<board.size, id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(0..<board.size, id: \.self) { column in
                        let position = Position(x: column, y: row)
                        CellView(
                            type: board.cell(at: position) ?? .water(filled: false),
                            hasSpirit: position == spirit.position,
                            spiritType: spirit.type
                        )
                    }
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    BoardView(board: .preview, spirit: Spirit(type: .water, position: Position(x: 0, y: 0)))
        .padding()
}
