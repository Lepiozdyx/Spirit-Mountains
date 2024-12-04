//
//  AchievementsView.swift
//  SpiritMountains
//
//  Created by Alex on 29.11.2024.
//

import SwiftUI

struct AchievementsView: View {
    @EnvironmentObject private var progressManager: ProgressManager
    
    var body: some View {
        ZStack {
            BGView()
            
            VStack {
                HStack {
                    BackButtonView()
                    Spacer()
                }
                
                VStack {
                    Text("PROGRESS")
                        .customFont(30, .white)
                    
                    // Achievements List
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(achievements) { achievement in
                                AchievementItemView(item: achievement)
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var achievements: [AchievementItem] {
        [
            AchievementItem(
                icon: .symbol,
                title: "TOTAL WINS",
                progress: progressManager.gamesWon,
                total: 100
            ),
            AchievementItem(
                icon: .flame,
                title: "OPEN 500 FIRE SQUARES",
                progress: progressManager.fireSquaresFilled,
                total: 500
            ),
            AchievementItem(
                icon: .drop,
                title: "OPEN 500 WATER SQUARES",
                progress: progressManager.waterSquaresFilled,
                total: 500
            )
        ]
    }
}

#Preview {
    NavigationView {
        AchievementsView()
            .environmentObject(ProgressManager())
    }
}
