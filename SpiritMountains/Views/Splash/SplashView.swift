//
//  SplashView.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var urlManager = URLManager()
    @State private var shouldShowGameRules = false
    @State private var shouldShowGame = false
    
    var body: some View {
        Group {
            if shouldShowGameRules {
                if let url = urlManager.gameURL {
                    WebView(url: url)
                }
            } else if shouldShowGame {
                MenuView()
            } else {
                loadingView
            }
        }
        .onAppear {
            checkURL()
        }
    }
    
    private var loadingView: some View {
        ZStack {
            BGView()
            
            Text("Loading...")
                .customFont(40, .white)
        }
    }
    
    private func checkURL() {

        if let _ = urlManager.gameURL {
            shouldShowGameRules = true
            return
        }
        
        Task {
            do {
                if let finalURL = try await urlManager.checkInitialURL() {
                    urlManager.saveURL(finalURL)
                    await MainActor.run {
                        withAnimation {
                            shouldShowGameRules = true
                        }
                    }
                } else {
                    await MainActor.run {
                        withAnimation {
                            shouldShowGame = true
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    withAnimation {
                        shouldShowGame = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
