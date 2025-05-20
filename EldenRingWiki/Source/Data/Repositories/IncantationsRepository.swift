
//
//  IncantationsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with incantation data,
/// including API-based and optionally offline file-based loading.
protocol IncantationsRepositoryProtocol {
    /// Fetch all incantations with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Incantation], Error>

    /// Fetch a incantation by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Incantation, Error>
}

// MARK: - Implementation

/// Default implementation of the IncantationsRepository using a IncantationsService.
class IncantationsRepository: IncantationsRepositoryProtocol {

    // MARK: - Properties

    private let service: IncantationsService

    // MARK: - Initialization

    init(service: IncantationsService) {
        self.service = service
    }

    // MARK: - IncantationsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Incantation], Error> {
        return service.fetchIncantations(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Incantation, Error> {
        return service.fetchIncantation(byId: id, fromFile: fromFile)
    }
}
