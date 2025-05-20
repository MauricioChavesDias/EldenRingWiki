
//
//  ArmorsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with armor data,
/// including API-based and optionally offline file-based loading.
protocol ArmorsRepositoryProtocol {
    /// Fetch all armors with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Armor], Error>

    /// Fetch a armor by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Armor, Error>
}

// MARK: - Implementation

/// Default implementation of the ArmorsRepository using a ArmorsService.
class ArmorsRepository: ArmorsRepositoryProtocol {

    // MARK: - Properties

    private let service: ArmorsService

    // MARK: - Initialization

    init(service: ArmorsService) {
        self.service = service
    }

    // MARK: - ArmorsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Armor], Error> {
        return service.fetchArmors(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Armor, Error> {
        return service.fetchArmor(byId: id, fromFile: fromFile)
    }
}
