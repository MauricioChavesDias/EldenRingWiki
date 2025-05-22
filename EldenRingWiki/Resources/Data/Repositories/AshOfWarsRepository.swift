
//
//  AshOfWarsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with ashofwar data,
/// including API-based and optionally offline file-based loading.
protocol AshOfWarsRepositoryProtocol {
    /// Fetch all ashofwars with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[AshOfWar], Error>

    /// Fetch a ashofwar by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<AshOfWar, Error>
}

// MARK: - Implementation

/// Default implementation of the AshOfWarsRepository using a AshOfWarsService.
class AshOfWarsRepository: AshOfWarsRepositoryProtocol {

    // MARK: - Properties

    private let service: AshOfWarsService

    // MARK: - Initialization

    init(service: AshOfWarsService) {
        self.service = service
    }

    // MARK: - AshOfWarsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[AshOfWar], Error> {
        return service.fetchAshOfWars(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<AshOfWar, Error> {
        return service.fetchAshOfWar(byId: id, fromFile: fromFile)
    }
}
