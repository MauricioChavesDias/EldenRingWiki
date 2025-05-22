
//
//  CreaturesRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with creature data,
/// including API-based and optionally offline file-based loading.
protocol CreaturesRepositoryProtocol {
    /// Fetch all creatures with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Creature], Error>

    /// Fetch a creature by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Creature, Error>
}

// MARK: - Implementation

/// Default implementation of the CreaturesRepository using a CreaturesService.
class CreaturesRepository: CreaturesRepositoryProtocol {

    // MARK: - Properties

    private let service: CreaturesService

    // MARK: - Initialization

    init(service: CreaturesService) {
        self.service = service
    }

    // MARK: - CreaturesRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Creature], Error> {
        return service.fetchCreatures(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Creature, Error> {
        return service.fetchCreature(byId: id, fromFile: fromFile)
    }
}
