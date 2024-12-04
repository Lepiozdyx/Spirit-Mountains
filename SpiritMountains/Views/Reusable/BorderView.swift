//
//  BorderView.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct BorderView: View {
    let text: String
    let fontSize: CGFloat
    let fontColor: Color
    let width: CGFloat
    let height: CGFloat
    var lineWidth: CGFloat = 5
    
    var body: some View {
        Text(text)
            .customFont(fontSize, fontColor)
            .padding()
            .frame(maxWidth: width, maxHeight: height)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.orange)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: lineWidth)
                    )
            )
    }
}

#Preview {
    BorderView(text: "About", fontSize: 30, fontColor: .primary, width: .infinity, height: 100)
        .padding(100)
        .background(BGView())
}
