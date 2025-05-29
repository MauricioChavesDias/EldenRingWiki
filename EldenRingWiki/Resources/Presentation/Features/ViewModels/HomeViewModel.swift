//
//  HomeViewModel.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var selectedCardItemType: CardItemType?

    func didSelectCard(_ card: CardItem) {
        selectedCardItemType = card.selectedCard
    }
    
    
}
