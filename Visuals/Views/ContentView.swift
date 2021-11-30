//
//  ContentView.swift
//  Workshop: Make It For Everyone
//  Visuals
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContrastDemo()
                .tabItem {
                    Label("Contrast", systemImage: "circle.lefthalf.filled")
                }
            ColorBlindnessDemo()
                .tabItem {
                    Label("Color Blindness", systemImage: "eye")
                }
            TypographyDemo()
                .tabItem {
                    Label("Typography", systemImage: "textformat")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
