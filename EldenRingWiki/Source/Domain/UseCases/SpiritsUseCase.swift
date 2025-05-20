
//
//  SpiritsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching spirits, supporting both API and local file sources.
protocol SpiritsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Spirit], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Spirit, Error>
}

/// Default implementation of the SpiritsUseCase that delegates to a repository.
class SpiritsUseCaseImpl: SpiritsUseCase {

    private let repository: SpiritsRepositoryProtocol

    init(repository: SpiritsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Spirit], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Spirit, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
