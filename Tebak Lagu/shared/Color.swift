//
//  Color.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

// reference: https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 08) & 0xFF) / 255,
                  blue: Double((hex >> 00) & 0xFF) / 255,
                  opacity: alpha)
    }
}
