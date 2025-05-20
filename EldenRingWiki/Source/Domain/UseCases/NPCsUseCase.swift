
//
//  NPCsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching npcs, supporting both API and local file sources.
protocol NPCsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[NPC], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<NPC, Error>
}

/// Default implementation of the NPCsUseCase that delegates to a repository.
class NPCsUseCaseImpl: NPCsUseCase {

    private let repository: NPCsRepositoryProtocol

    init(repository: NPCsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[NPC], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<NPC, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
