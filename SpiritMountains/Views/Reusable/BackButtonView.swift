//
//  BackButtonView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.primary)
                .frame(width: 35, height: 35)
                .background(.orange)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    BackButtonView()
}
