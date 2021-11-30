//
//  Color+ContrastRatio.swift
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


extension Color {
    /// Returns  a color’s relative luminance.
    /// Relative luminance is normalized value from a value of 0 for the darkest black to a value of 1 for the lightest white.
    /// - Returns: A color’s relative luminance, given in the range 0 to 1 if possible to determine; otherwise, nil.
    var luminance: Double? {
        guard
            let components = self.cgColor?.components?.dropLast(),
            components.count == 3
        else { return nil }
        let sRGBComponents: [Double] = components.map {
            let component = Double($0)
            let sRGBComponent = component <= 0.03928 ? component / 12.92 : pow((component + 0.055) / 1.055, 2.4)
            return sRGBComponent
        }
        let red = sRGBComponents[0]
        let green = sRGBComponents[1]
        let blue = sRGBComponents[2]
        let luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        return luminance
    }
}

extension Color {
    /// Returns the contrast ratio between two colors.
    /// - Parameters:
    ///   - firstColor: First color
    ///   - secondColor: Second color
    /// - Returns: Contrast ratio between two colors if possible to determine; otherwise, nil.
    static func contrastRatio(firstColor: Color, secondColor: Color) -> Double? {
        guard
            let firstColorLuminance = firstColor.luminance,
            let secondColorLuminance = secondColor.luminance
        else { return nil }
        let maxLuminance = max(firstColorLuminance, secondColorLuminance)
        let minLuminance = min(firstColorLuminance, secondColorLuminance)
        let ratio = (maxLuminance + 0.05) / (minLuminance + 0.05)
        return ratio
    }
}
