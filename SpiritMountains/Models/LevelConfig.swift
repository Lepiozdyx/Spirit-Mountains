//
//  LevelConfig.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import Foundation

extension GameManager {
    static func createLevelSetups() -> [[[CellType]]] {
        return [
            [
                [.water(filled: true), .water(filled: false), .water(filled: false), .water(filled: false), .water(filled: false), .switcher],
                [.water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.switcher, .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)]
            ],
            [
                [.water(filled: true), .water(filled: false), .water(filled: false), .water(filled: false), .switcher, .fire(filled: false)],
                [.water(filled: false), .water(filled: false), .water(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.water(filled: false), .switcher, .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)]
            ],
            [
                [.water(filled: true), .water(filled: false), .water(filled: false), .water(filled: false),  .water(filled: false), .water(filled: false)],
                [.water(filled: false), .water(filled: false), .fire(filled: false), .switcher, .water(filled: false), .water(filled: false)],
                [.water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .switcher],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .switcher, .water(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
                [.water(filled: false), .water(filled: false), .water(filled: false), .switcher, .fire(filled: false), .fire(filled: false)]
            ],
            [
                [.water(filled: true), .water(filled: false), .water(filled: false), .switcher,  .water(filled: false), .water(filled: false)],
                [.water(filled: false), .water(filled: false), .water(filled: false), .fire(filled: false), .water(filled: false), .water(filled: false)],
                [.water(filled: false), .water(filled: false), .water(filled: false), .fire(filled: false),  .switcher, .water(filled: false)],
                [.water(filled: false), .water(filled: false), .switcher, .fire(filled: false),  .fire(filled: false), .water(filled: false)],
                [.switcher, .switcher, .fire(filled: false), .fire(filled: false), .fire(filled: false), .switcher],
                [.fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)]
            ],
            [
                [.water(filled: true), .water(filled: false), .switcher, .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.switcher, .water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
                [.fire(filled: false), .fire(filled: false), .water(filled: false), .fire(filled: false),  .fire(filled: false), .switcher],
                [.fire(filled: false), .fire(filled: false), .switcher, .fire(filled: false),  .fire(filled: false), .fire(filled: false)],
                [.switcher, .water(filled: false), .water(filled: false), .water(filled: false), .switcher, .fire(filled: false)],
                [.switcher, .water(filled: false), .water(filled: false), .water(filled: false), .water(filled: false), .water(filled: false)]
            ]
        ]
    }
}

// MARK: - GameBoard Preview
extension GameBoard {
    static var preview: GameBoard {
        let setup: [[CellType]] = [
            [.water(filled: true), .water(filled: false), .switcher, .water(filled: false), .water(filled: false), .water(filled: false)],
            [.water(filled: false), .water(filled: false), .switcher, .water(filled: false), .water(filled: false), .water(filled: false)],
            [.water(filled: false), .switcher, .switcher, .water(filled: false), .switcher, .water(filled: false)],
            [.water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
            [.water(filled: false), .water(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)],
            [.water(filled: false), .switcher, .fire(filled: false), .fire(filled: false), .fire(filled: false), .fire(filled: false)]
        ]
        return GameBoard(setup: setup)
    }
}
