
//
//  SorceriesUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching sorcerys, supporting both API and local file sources.
protocol SorceriesUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Sorcery], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Sorcery, Error>
}

/// Default implementation of the SorceriesUseCase that delegates to a repository.
class SorceriesUseCaseImpl: SorceriesUseCase {

    private let repository: SorceriesRepositoryProtocol

    init(repository: SorceriesRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Sorcery], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Sorcery, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
