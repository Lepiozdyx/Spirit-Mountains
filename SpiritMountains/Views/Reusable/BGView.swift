//
//  BGView.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct BGView: View {
    var body: some View {
        Color.db
            .overlay {
                Image(.bg)
                    .resizable()
            }
            .ignoresSafeArea()
    }
}

#Preview {
    BGView()
}
