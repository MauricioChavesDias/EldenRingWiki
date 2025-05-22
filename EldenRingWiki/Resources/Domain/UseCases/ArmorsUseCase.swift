
//
//  ArmorsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching armors, supporting both API and local file sources.
protocol ArmorsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Armor], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Armor, Error>
}

/// Default implementation of the ArmorsUseCase that delegates to a repository.
class ArmorsUseCaseImpl: ArmorsUseCase {

    private let repository: ArmorsRepositoryProtocol

    init(repository: ArmorsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Armor], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Armor, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
