//
//  SpiritMountainsApp.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

@main
struct SpiritMountainsApp: App {
    @StateObject private var gameManager: GameManager
    @StateObject private var progressManager = ProgressManager()
    
    init() {
        let progress = ProgressManager()
        _progressManager = StateObject(wrappedValue: progress)
        _gameManager = StateObject(wrappedValue: GameManager(progressManager: progress))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(gameManager)
                .environmentObject(progressManager)
        }
    }
}
