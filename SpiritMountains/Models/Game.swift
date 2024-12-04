//
//  Game.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import Foundation

enum SpiritType: Equatable {
    case water
    case fire
}

struct Spirit: Equatable {
    let type: SpiritType
    var position: Position
}

// MARK: - Achievement
struct AchievementItem: Identifiable {
    let id = UUID()
    let icon: ImageResource
    let title: String
    let progress: Int
    let total: Int
}

// MARK: - Position
struct Position: Equatable, Hashable {
    let x: Int
    let y: Int
    
    func isValid(boardSize: Int) -> Bool {
        x >= 0 && x < boardSize && y >= 0 && y < boardSize
    }
    
    func adjacent(to position: Position) -> Bool {
        let dx = abs(x - position.x)
        let dy = abs(y - position.y)
        return (dx == 1 && dy == 0) || (dx == 0 && dy == 1)
    }
}

// MARK: - Cell
enum CellType: Equatable {
    case water(filled: Bool)
    case fire(filled: Bool)
    case switcher
    
    var isWater: Bool {
        if case .water = self { return true }
        return false
    }
    
    var isFire: Bool {
        if case .fire = self { return true }
        return false
    }
    
    var isSwitcher: Bool {
        if case .switcher = self { return true }
        return false
    }
}

// MARK: - GameBoard
struct GameBoard: Equatable {
    let size: Int
    private(set) var cells: [[CellType]]
    
    init(size: Int = 6, setup: [[CellType]]) {
        self.size = size
        self.cells = setup
    }
    
    func cell(at position: Position) -> CellType? {
        guard position.isValid(boardSize: size) else { return nil }
        return cells[position.y][position.x]
    }
    
    mutating func fillCell(at position: Position, with spirit: SpiritType) -> Bool {
        guard position.isValid(boardSize: size) else { return false }
        
        switch (cells[position.y][position.x], spirit) {
        case (.water(filled: false), .water):
            cells[position.y][position.x] = .water(filled: true)
            return true
        case (.fire(filled: false), .fire):
            cells[position.y][position.x] = .fire(filled: true)
            return true
        default:
            return false
        }
    }
    
    func isValidMove(from: Position, to: Position, spirit: SpiritType) -> Bool {
        guard from.isValid(boardSize: size),
              to.isValid(boardSize: size),
              from.adjacent(to: to) else {
            return false
        }
        
        let targetCell = cell(at: to)
        switch (targetCell, spirit) {
        case (.water(filled: false), .water),
             (.fire(filled: false), .fire),
             (.switcher, _):
            return true
        default:
            return false
        }
    }
    
    func isComplete() -> Bool {
        for row in cells {
            for cell in row {
                switch cell {
                case .water(filled: false), .fire(filled: false):
                    return false
                default:
                    continue
                }
            }
        }
        return true
    }
}
