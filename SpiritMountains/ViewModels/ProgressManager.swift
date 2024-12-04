//
//  ProgressManager.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import Foundation

class ProgressManager: ObservableObject {
    @Published private(set) var gamesWon: Int = 0
    @Published private(set) var waterSquaresFilled: Int = 0
    @Published private(set) var fireSquaresFilled: Int = 0
    
    private let storage: UserDefaults
    
    private enum Keys {
        static let gamesWon = "gamesWon"
        static let waterSquares = "waterSquares"
        static let fireSquares = "fireSquares"
    }
    
    init(storage: UserDefaults = .standard) {
        self.storage = storage
        loadProgress()
    }
    
    private func loadProgress() {
        gamesWon = storage.integer(forKey: Keys.gamesWon)
        waterSquaresFilled = storage.integer(forKey: Keys.waterSquares)
        fireSquaresFilled = storage.integer(forKey: Keys.fireSquares)
    }
    
    private func saveProgress() {
        storage.set(gamesWon, forKey: Keys.gamesWon)
        storage.set(waterSquaresFilled, forKey: Keys.waterSquares)
        storage.set(fireSquaresFilled, forKey: Keys.fireSquares)
    }
    
    func incrementGamesWon() {
        gamesWon += 1
        saveProgress()
    }
    
    func incrementWaterSquares() {
        waterSquaresFilled += 1
        saveProgress()
    }
    
    func incrementFireSquares() {
        fireSquaresFilled += 1
        saveProgress()
    }
}
