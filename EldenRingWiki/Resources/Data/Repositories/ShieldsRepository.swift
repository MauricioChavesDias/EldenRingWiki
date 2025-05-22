
//
//  ShieldsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with shield data,
/// including API-based and optionally offline file-based loading.
protocol ShieldsRepositoryProtocol {
    /// Fetch all shields with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Shield], Error>

    /// Fetch a shield by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Shield, Error>
}

// MARK: - Implementation

/// Default implementation of the ShieldsRepository using a ShieldsService.
class ShieldsRepository: ShieldsRepositoryProtocol {

    // MARK: - Properties

    private let service: ShieldsService

    // MARK: - Initialization

    init(service: ShieldsService) {
        self.service = service
    }

    // MARK: - ShieldsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Shield], Error> {
        return service.fetchShields(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Shield, Error> {
        return service.fetchShield(byId: id, fromFile: fromFile)
    }
}
