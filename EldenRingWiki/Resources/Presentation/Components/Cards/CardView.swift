//
// CardView.swift
// EldenRingWiki
//
// Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

struct CardView: View {
    let card: CardItem

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(card.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIConstants.Sizes.cardWidth, height: UIConstants.Sizes.cardHeight)
                .clipped()
                .cornerRadius(UIConstants.CornerRadius.card)

            Text(card.title)
                .font(.subheadline.bold())
                .foregroundColor(UIConstants.Colors.darkYellow)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .padding(.horizontal, UIConstants.Spacing.medium)
                .padding(.bottom)
        }
        .frame(width: UIConstants.Sizes.cardWidth, height: UIConstants.Sizes.cardHeight)
        .cornerRadius(UIConstants.CornerRadius.card)
    }
}

#Preview {
    if let card = CardItem.allCases.first(where: { $0.title == StringConstants.Titles.incantations }) {
        CardView(card: card)
    }
}
