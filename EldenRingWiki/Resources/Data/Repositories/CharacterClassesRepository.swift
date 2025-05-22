
//
//  CharacterClassesRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with characterclass data,
/// including API-based and optionally offline file-based loading.
protocol CharacterClassesRepositoryProtocol {
    /// Fetch all characterclasss with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[CharacterClass], Error>

    /// Fetch a characterclass by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<CharacterClass, Error>
}

// MARK: - Implementation

/// Default implementation of the CharacterClassesRepository using a CharacterClassesService.
class CharacterClassesRepository: CharacterClassesRepositoryProtocol {

    // MARK: - Properties

    private let service: ClassesService

    // MARK: - Initialization

    init(service: ClassesService) {
        self.service = service
    }

    // MARK: - CharacterClassesRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[CharacterClass], Error> {
        return service.fetchCharacterClasses(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<CharacterClass, Error> {
        return service.fetchCharacterClass(byId: id, fromFile: fromFile)
    }
}
