
//
//  AmmosRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with ammo data,
/// including API-based and optionally offline file-based loading.
protocol AmmosRepositoryProtocol {
    /// Fetch all ammos with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Ammo], Error>

    /// Fetch a ammo by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Ammo, Error>
}

// MARK: - Implementation

/// Default implementation of the AmmosRepository using a AmmosService.
class AmmosRepository: AmmosRepositoryProtocol {

    // MARK: - Properties

    private let service: AmmosService

    // MARK: - Initialization

    init(service: AmmosService) {
        self.service = service
    }

    // MARK: - AmmosRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Ammo], Error> {
        return service.fetchAmmos(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Ammo, Error> {
        return service.fetchAmmo(byId: id, fromFile: fromFile)
    }
}
