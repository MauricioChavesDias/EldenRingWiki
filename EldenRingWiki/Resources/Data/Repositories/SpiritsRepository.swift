
//
//  SpiritsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with spirit data,
/// including API-based and optionally offline file-based loading.
protocol SpiritsRepositoryProtocol {
    /// Fetch all spirits with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Spirit], Error>

    /// Fetch a spirit by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Spirit, Error>
}

// MARK: - Implementation

/// Default implementation of the SpiritsRepository using a SpiritsService.
class SpiritsRepository: SpiritsRepositoryProtocol {

    // MARK: - Properties

    private let service: SpiritsService

    // MARK: - Initialization

    init(service: SpiritsService) {
        self.service = service
    }

    // MARK: - SpiritsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Spirit], Error> {
        return service.fetchSpirits(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Spirit, Error> {
        return service.fetchSpirit(byId: id, fromFile: fromFile)
    }
}
