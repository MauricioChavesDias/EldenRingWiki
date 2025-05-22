
//
//  AshOfWarsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching ashofwars, supporting both API and local file sources.
protocol AshOfWarsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[AshOfWar], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<AshOfWar, Error>
}

/// Default implementation of the AshOfWarsUseCase that delegates to a repository.
class AshOfWarsUseCaseImpl: AshOfWarsUseCase {

    private let repository: AshOfWarsRepositoryProtocol

    init(repository: AshOfWarsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[AshOfWar], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<AshOfWar, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
