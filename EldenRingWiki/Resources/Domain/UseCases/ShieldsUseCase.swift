
//
//  ShieldsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching shields, supporting both API and local file sources.
protocol ShieldsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Shield], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Shield, Error>
}

/// Default implementation of the ShieldsUseCase that delegates to a repository.
class ShieldsUseCaseImpl: ShieldsUseCase {

    private let repository: ShieldsRepositoryProtocol

    init(repository: ShieldsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Shield], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Shield, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
