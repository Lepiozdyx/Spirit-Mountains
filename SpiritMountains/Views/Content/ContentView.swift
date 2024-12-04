//
//  ContentView.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var gameManager: GameManager
    @EnvironmentObject private var progressManager: ProgressManager
    
    var body: some View {
        SplashView()
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    let progress = ProgressManager()
    return ContentView()
        .environmentObject(GameManager(progressManager: progress))
        .environmentObject(progress)
}
