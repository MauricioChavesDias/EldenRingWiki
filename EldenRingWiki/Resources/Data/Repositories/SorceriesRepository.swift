
//
//  SorceriesRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with sorcery data,
/// including API-based and optionally offline file-based loading.
protocol SorceriesRepositoryProtocol {
    /// Fetch all sorcerys with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Sorcery], Error>

    /// Fetch a sorcery by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Sorcery, Error>
}

// MARK: - Implementation

/// Default implementation of the SorceriesRepository using a SorceriesService.
class SorceriesRepository: SorceriesRepositoryProtocol {

    // MARK: - Properties

    private let service: SorceriesService

    // MARK: - Initialization

    init(service: SorceriesService) {
        self.service = service
    }

    // MARK: - SorceriesRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Sorcery], Error> {
        return service.fetchSorceries(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Sorcery, Error> {
        return service.fetchSorcery(byId: id, fromFile: fromFile)
    }
}
