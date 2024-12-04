//
//  GameView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject private var gameManager: GameManager
    @EnvironmentObject private var progressManager: ProgressManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            ZStack(alignment: .top) {
                BGView()
                
                HStack {
                    BackButtonView()
                    Spacer()
                }
                .padding()
                
                VStack {
                    // Level indicator
                    BorderView(
                        text: "Level \(gameManager.currentLevel)",
                        fontSize: 26,
                        fontColor: .primary,
                        width: 200,
                        height: 25,
                        lineWidth: 1
                    )
                    .padding(.top)
                    
                    if isLandscape {
                        HorizontalGameLayout(
                            board: gameManager.currentBoard,
                            spirit: gameManager.currentSpirit,
                            onMove: { gameManager.move($0) }
                        )
                    } else {
                        VerticalGameLayout(
                            board: gameManager.currentBoard,
                            spirit: gameManager.currentSpirit,
                            onMove: { gameManager.move($0) }
                        )
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert("You Win!", isPresented: Binding(
            get: { gameManager.gameState == .won },
            set: { _ in }
        )) {
            Button("Next Level") {
                progressManager.incrementGamesWon()
                gameManager.startNewGame()
            }
            Button("Menu") {
                progressManager.incrementGamesWon()
                gameManager.resetGame()
                dismiss()
            }
        }
        .alert("Game Over", isPresented: Binding(
            get: { gameManager.gameState == .lost },
            set: { _ in }
        )) {
            Button("Try Again") {
                gameManager.startNewGame()
            }
            Button("Menu") {
                gameManager.resetGame()
                dismiss()
            }
        }
    }
}

// Horizontal layout for landscape orientation
private struct HorizontalGameLayout: View {
    let board: GameBoard
    let spirit: Spirit
    let onMove: (GameManager.Direction) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                // Game board
                BoardView(board: board, spirit: spirit)
                
                Spacer()
                
                // Control buttons
                ControlPadView(onMove: onMove)
                    .padding(.trailing)
            }
            .padding(.top)
        }
    }
}

// Vertical layout for portrait orientation
private struct VerticalGameLayout: View {
    let board: GameBoard
    let spirit: Spirit
    let onMove: (GameManager.Direction) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Game board
                BoardView(board: board, spirit: spirit)
                
                Spacer()
                
                // Control buttons
                ControlPadView(onMove: onMove)
                    .padding(.bottom)
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    NavigationView {
        let progress = ProgressManager()
        return GameView()
            .environmentObject(GameManager(progressManager: progress))
            .environmentObject(progress)
    }
}
