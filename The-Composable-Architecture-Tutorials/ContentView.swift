//
//  ContentView.swift
//  The-Composable-Architecture-Tutorials
//
//  Created by yusukeyokota on 2026/03/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
