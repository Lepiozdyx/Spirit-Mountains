//
//  AboutView.swift
//  SpiritMountains
//
//  Created by Alex on 30.11.2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            BGView()
            
            VStack {
                HStack {
                    BackButtonView()
                    Spacer()
                }
                
                VStack {
                    Text("ABOUT SPIRIT GAMING")
                        .customFont(28, .white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Text(TextStorage.about)
                                .customFont(15, .white)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView {
        AboutView()
    }
}
