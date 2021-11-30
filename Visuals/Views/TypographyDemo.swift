//
//  TypographyDemo.swift
//  Workshop: Make It For Everyone
//  Visuals
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI

struct TypographyDemo: View {
    @State var isCustomFont = true

    var font: Font {
        isCustomFont ? Font.custom("Savoye Let", size: 17) : Font.system(.body)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Toggle("Custom Font", isOn: $isCustomFont)
                Text("There are many different fonts, each of which has a unique visual style. Using a complex font type with decorative elements will make your content more difficult to read.\n\nYou have to allow adjusting  the text size used on your app.\n\nMake the font bigger using Settings > Accessibility > Display & Text Size > Larger Text and see how apps that supports Dynamic Type will adjust to preferred reading size."
                )
                    .font(font)
                Spacer()
            }
            .padding()
            .navigationTitle("Typography")
        }
    }
}

struct TypographyDemo_Previews: PreviewProvider {
    static var previews: some View {
        TypographyDemo()
    }
}
