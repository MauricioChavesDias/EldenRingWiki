
//
//  IncantationsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching incantations, supporting both API and local file sources.
protocol IncantationsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Incantation], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Incantation, Error>
}

/// Default implementation of the IncantationsUseCase that delegates to a repository.
class IncantationsUseCaseImpl: IncantationsUseCase {

    private let repository: IncantationsRepositoryProtocol

    init(repository: IncantationsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Incantation], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Incantation, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
