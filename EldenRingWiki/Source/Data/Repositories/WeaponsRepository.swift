
//
//  WeaponsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with weapon data,
/// including API-based and optionally offline file-based loading.
protocol WeaponsRepositoryProtocol {
    /// Fetch all weapons with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Weapon], Error>

    /// Fetch a weapon by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Weapon, Error>
}

// MARK: - Implementation

/// Default implementation of the WeaponsRepository using a WeaponsService.
class WeaponsRepository: WeaponsRepositoryProtocol {

    // MARK: - Properties

    private let service: WeaponsService

    // MARK: - Initialization

    init(service: WeaponsService) {
        self.service = service
    }

    // MARK: - WeaponsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Weapon], Error> {
        return service.fetchWeapons(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Weapon, Error> {
        return service.fetchWeapon(byId: id, fromFile: fromFile)
    }
}
