//
//  Text+Ext.swift
//  SpiritMountains
//
//  Created by Alex on 26.11.2024.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .customFont(30, .primary)
    }
}

extension Text {
    func customFont(_ size: CGFloat, _ color: Color) -> some View {
        self
            .foregroundStyle(color)
            .font(.system(size: size, weight: .bold, design: .monospaced))
    }
}

#Preview {
    TextView()
}
