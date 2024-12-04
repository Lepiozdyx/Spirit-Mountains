//
//  MenuView.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var gameManager: GameManager
    @EnvironmentObject private var progressManager: ProgressManager
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                BGView()
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    NavigationLink {
                        GameView()
                    } label: {
                        BorderView(
                            text: "Start",
                            fontSize: 30,
                            fontColor: .primary,
                            width: 360,
                            height: 80
                        )
                    }
                    
                    NavigationLink {
                        RulesView()
                    } label: {
                        BorderView(
                            text: "Game Rules",
                            fontSize: 30,
                            fontColor: .primary,
                            width: 360,
                            height: 80
                        )
                    }
                    
                    NavigationLink {
                        AchievementsView()
                    } label: {
                        BorderView(
                            text: "Progress",
                            fontSize: 30,
                            fontColor: .primary,
                            width: 360,
                            height: 80
                        )
                    }
                    
                    NavigationLink {
                        AboutView()
                    } label: {
                        BorderView(
                            text: "About",
                            fontSize: 30,
                            fontColor: .primary,
                            width: 360,
                            height: 80
                        )
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Image(.fire)
                        .resizable()
                        .frame(width: 160, height: 260)
                        .offset(x: -60, y: 40)
                    Spacer()
                    Image(.water)
                        .resizable()
                        .frame(width: 160, height: 260)
                        .offset(x: 60, y: 40)
                }
            }
        }
    }
}

#Preview {
    let progress = ProgressManager()
    return MenuView()
        .environmentObject(GameManager(progressManager: progress))
        .environmentObject(progress)
}
