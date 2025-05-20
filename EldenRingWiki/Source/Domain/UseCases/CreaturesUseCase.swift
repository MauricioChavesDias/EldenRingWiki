
//
//  CreaturesUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching creatures, supporting both API and local file sources.
protocol CreaturesUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Creature], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Creature, Error>
}

/// Default implementation of the CreaturesUseCase that delegates to a repository.
class CreaturesUseCaseImpl: CreaturesUseCase {

    private let repository: CreaturesRepositoryProtocol

    init(repository: CreaturesRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Creature], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Creature, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
