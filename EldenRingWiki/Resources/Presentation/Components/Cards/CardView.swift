//
// CardView.swift
// EldenRingWiki
//
// Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

struct CardView: View {
    var card: CardItem

    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                Image(card.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(UIConstants.CornerRadius.card)

                Text(card.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(UIConstants.Colors.darkYellow)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .padding(.bottom)
                    .padding(.horizontal, UIConstants.Spacing.medium)
            }
        }
        .frame(width: UIConstants.Sizes.cardWidth, height: UIConstants.Sizes.cardHeight)
        .opacity(0.9)
        .cornerRadius(UIConstants.CornerRadius.card)
    }
}

#Preview {
    let card = CardItem.allCases.first { $0.title == StringConstants.Titles.incantations }!
    CardView(card: card)
}
