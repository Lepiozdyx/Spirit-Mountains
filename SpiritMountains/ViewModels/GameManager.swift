//
//  GameManager.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import Foundation

class GameManager: ObservableObject {
    enum GameState {
        case playing
        case won
        case lost
    }
    
    @Published private(set) var currentBoard: GameBoard
    @Published private(set) var currentSpirit: Spirit
    @Published private(set) var currentLevel: Int = 1
    @Published private(set) var gameState: GameState = .playing
    
    private let levels: [[[CellType]]]
    private let progressManager: ProgressManager
    
    init(progressManager: ProgressManager) {
        self.progressManager = progressManager
        self.levels = GameManager.createLevelSetups()
        self.currentBoard = GameBoard(setup: levels[0])
        self.currentSpirit = Spirit(type: .water, position: Position(x: 0, y: 0))
    }
    
    func move(_ direction: Direction) {
        let newPosition = calculateNewPosition(from: currentSpirit.position, direction: direction)
        
        guard currentBoard.isValidMove(
            from: currentSpirit.position,
            to: newPosition,
            spirit: currentSpirit.type
        ) else {
            return
        }
        
        var updatedBoard = currentBoard
        let targetCell = currentBoard.cell(at: newPosition)
        
        if case .switcher = targetCell {
            if updatedBoard.fillCell(at: currentSpirit.position, with: currentSpirit.type) {
                incrementSquareCount(for: currentSpirit.type)
            }
            currentBoard = updatedBoard
            switchSpirit(at: newPosition)
        } else {
            if updatedBoard.fillCell(at: newPosition, with: currentSpirit.type) {
                incrementSquareCount(for: currentSpirit.type)
            }
            currentBoard = updatedBoard
            currentSpirit.position = newPosition
        }
        
        checkGameState()
    }
    
    private func incrementSquareCount(for spiritType: SpiritType) {
        switch spiritType {
        case .water:
            progressManager.incrementWaterSquares()
        case .fire:
            progressManager.incrementFireSquares()
        }
    }
    
    private func switchSpirit(at position: Position) {
        currentSpirit = Spirit(
            type: currentSpirit.type == .water ? .fire : .water,
            position: position
        )
    }
    
    private func checkGameState() {
        if currentBoard.isComplete() {
            gameState = .won
        } else if !hasValidMoves() {
            gameState = .lost
        }
    }
    
    private func hasValidMoves() -> Bool {
        let directions: [Direction] = [.up, .down, .left, .right]
        
        for direction in directions {
            let newPosition = calculateNewPosition(from: currentSpirit.position, direction: direction)
            if currentBoard.isValidMove(from: currentSpirit.position,
                                      to: newPosition,
                                      spirit: currentSpirit.type) {
                return true
            }
        }
        return false
    }
    
    func startNewGame() {
        currentLevel = (currentLevel % 5) + 1
        currentBoard = GameBoard(setup: levels[currentLevel - 1])
        currentSpirit = Spirit(type: .water, position: Position(x: 0, y: 0))
        gameState = .playing
    }
    
    func resetGame() {
        currentLevel = 1
        currentBoard = GameBoard(setup: levels[0])
        currentSpirit = Spirit(type: .water, position: Position(x: 0, y: 0))
        gameState = .playing
    }
    
    enum Direction {
        case up, down, left, right
    }
    
    private func calculateNewPosition(from position: Position, direction: Direction) -> Position {
        switch direction {
        case .up:
            return Position(x: position.x, y: position.y - 1)
        case .down:
            return Position(x: position.x, y: position.y + 1)
        case .left:
            return Position(x: position.x - 1, y: position.y)
        case .right:
            return Position(x: position.x + 1, y: position.y)
        }
    }
}
