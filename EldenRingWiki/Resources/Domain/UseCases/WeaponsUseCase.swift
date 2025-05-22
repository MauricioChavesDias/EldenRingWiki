
//
//  WeaponsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching weapons, supporting both API and local file sources.
protocol WeaponsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Weapon], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Weapon, Error>
}

/// Default implementation of the WeaponsUseCase that delegates to a repository.
class WeaponsUseCaseImpl: WeaponsUseCase {

    private let repository: WeaponsRepositoryProtocol

    init(repository: WeaponsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Weapon], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Weapon, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
