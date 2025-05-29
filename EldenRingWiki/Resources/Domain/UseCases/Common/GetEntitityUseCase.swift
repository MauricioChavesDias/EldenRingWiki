//
//  GetEntitityUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 23/5/2025.
//

import Combine
import Foundation

protocol AnyEntityRepository {
    func fetchAll() -> AnyPublisher<[any EldenRingEntity], Error>
}

final class GetEntitiesUseCase {
    private let repositoryMap: [CardItemType: any AnyEntityRepository]

    init(repositoryMap: [CardItemType: any AnyEntityRepository]) {
        self.repositoryMap = repositoryMap
    }

    func execute(for type: CardItemType) -> AnyPublisher<[any EldenRingEntity], Error> {
        guard let repo = repositoryMap[type] else {
            return Fail(error: NSError(domain: "Unknown CardItemType", code: -1)).eraseToAnyPublisher()
        }
        return repo.fetchAll()
    }
}
