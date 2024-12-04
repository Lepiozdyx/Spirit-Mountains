//
//  RulesView.swift
//  SpiritMountains
//
//  Created by Alex on 27.11.2024.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        WebView(url: URL(string: "https://spiritgaming.xyz/rules.html")!)
    }
}

#Preview {
    RulesView()
}
