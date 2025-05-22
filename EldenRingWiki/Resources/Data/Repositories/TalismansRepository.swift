
//
//  TalismansRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with talisman data,
/// including API-based and optionally offline file-based loading.
protocol TalismansRepositoryProtocol {
    /// Fetch all talismans with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Talisman], Error>

    /// Fetch a talisman by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Talisman, Error>
}

// MARK: - Implementation

/// Default implementation of the TalismansRepository using a TalismansService.
class TalismansRepository: TalismansRepositoryProtocol {

    // MARK: - Properties

    private let service: TalismansService

    // MARK: - Initialization

    init(service: TalismansService) {
        self.service = service
    }

    // MARK: - TalismansRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Talisman], Error> {
        return service.fetchTalismans(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Talisman, Error> {
        return service.fetchTalisman(byId: id, fromFile: fromFile)
    }
}
