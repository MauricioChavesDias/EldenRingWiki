//
//  DynamicListViewModel.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 23/5/2025.
//

import Combine
import Foundation

final class DynamicListViewModel: ObservableObject {
    // Exposed properties
    let type: CardItemType
    @Published var displayItems: [AnyEntity] = []

    // Internal state
    private let useCase: GetEntitiesUseCase
    private var cancellables = Set<AnyCancellable>()

    // Initializer
    init(type: CardItemType, useCase: GetEntitiesUseCase) {
        self.type = type
        self.useCase = useCase
        load()
    }

    // Load and map to type-erased entities
    private func load() {
        useCase.execute(for: type)
            .map { $0.map(AnyEntity.init(from:)) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                // Handle errors/logging if needed
                if case let .failure(error) = completion {
                    print("Error loading entities for type \(self.type): \(error)")
                }
            }, receiveValue: { [weak self] items in
                guard let self = self else { return }
                self.displayItems = items
            })
            .store(in: &cancellables)
    }
}
