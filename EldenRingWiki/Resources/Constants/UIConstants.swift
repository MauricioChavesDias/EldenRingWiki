//
//  UIConstants.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

enum UIConstants {
    enum Spacing {
        static let small: CGFloat = 4
        static let medium: CGFloat = 8
        static let large: CGFloat = 16
    }

    enum CornerRadius {
        static let card: CGFloat = 10
        static let image: CGFloat = 8
    }

    enum Sizes {
        static let cardWidth: CGFloat = 100
        static let cardHeight: CGFloat = 120
        static let imageSize: CGFloat = 50
    }

    enum Colors {
        static let darkYellow = Color("darkYellow")
        static let darkGreen  = Color("darkGreen")
        static let lightGreen = Color("lightGreen")
        static let accent = Color.accentColor
    }
}
