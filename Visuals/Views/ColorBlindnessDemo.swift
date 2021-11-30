//
//  ColorBlindnessDemo.swift
//  Workshop: Make It For Everyone
//  Visuals
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


struct ColorBlindnessDemo: View {
    @State var firstColor = Color(hex: 0x49B135)
    @State var secondColor = Color(hex: 0xF75701)

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack {
                    ColorPicker("First Color", selection: $firstColor)
                    ColorPicker("Second Color", selection: $secondColor)
                }
                HStack {
                    Text("Red–green color blindness is the most common form of color blindness. It affects up to 8% of males and 0.5% of females.")
                        .font(.headline)
                        .foregroundColor(firstColor)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(secondColor)
                        )
                    Text("Test this screen using Sim Daltonism app and selecting Deuteranopia as simulated vision. Change the colors to make sure that text is legible for everyone.")
                        .font(.headline)
                        .foregroundColor(secondColor)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(firstColor)
                        )
                }
            }
            .padding()
            .navigationTitle("Color Blindness")
        }
    }
}

struct ColorBlindnessDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorBlindnessDemo()
    }
}
