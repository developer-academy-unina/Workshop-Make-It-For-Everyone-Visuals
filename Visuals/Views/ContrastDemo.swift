//
//  ContrastDemo.swift
//  Workshop: Make It For Everyone
//  Visuals
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI

struct ContrastDemo: View {
    @State var foregroundColor = Color(hex: 0x2F7B08)
    @State var backgroundColor = Color(hex: 0x6C16B9)

    var contrastRatio: String {
        guard
            let ratio = Color.contrastRatio(
                firstColor: foregroundColor,
                secondColor: backgroundColor
            )
        else { return " - " }
        return String(format: "%.2f", ratio)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack {
                    ColorPicker("Foreground color", selection: $foregroundColor)
                    ColorPicker("Background color", selection: $backgroundColor)
                }
                Text("When using colors, it is important to have sufficient contrast between the background color and foreground color.\n\nAccording to guidelines, text should have a contrast ratio of at least 4.5:1 against its background.\n\nChange the foreground or background colors and make sure that the text is legible.")
                    .font(.headline)
                    .padding()
                    .foregroundColor(foregroundColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(backgroundColor)
                    )
                Text("Contrast Ratio: \(contrastRatio) ")
                    .bold()
            }
            .padding()
            .navigationTitle("Contrast")
        }
    }
}

struct ContrastDemo_Previews: PreviewProvider {
    static var previews: some View {
        ContrastDemo()
    }
}
