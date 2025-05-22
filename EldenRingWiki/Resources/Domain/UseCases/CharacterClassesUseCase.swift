
//
//  CharacterClassesUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching characterclasss, supporting both API and local file sources.
protocol CharacterClassesUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[CharacterClass], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<CharacterClass, Error>
}

/// Default implementation of the CharacterClassesUseCase that delegates to a repository.
class CharacterClassesUseCaseImpl: CharacterClassesUseCase {

    private let repository: CharacterClassesRepositoryProtocol

    init(repository: CharacterClassesRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[CharacterClass], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<CharacterClass, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
