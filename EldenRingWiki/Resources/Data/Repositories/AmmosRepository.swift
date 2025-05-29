
//
//  AmmosRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining ammo-specific data access.
protocol AmmosRepositoryProtocol {
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Ammo], Error>
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Ammo, Error>
}

// MARK: - Implementation

/// Repository that provides ammo data using a service.
final class AmmosRepository: AmmosRepositoryProtocol {
    private let service: AmmosService

    init(service: AmmosService) {
        self.service = service
    }

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Ammo], Error> {
        service.fetchAmmos(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Ammo, Error> {
        service.fetchAmmo(byId: id, fromFile: fromFile)
    }
}

// MARK: - Dynamic Entity Support

/// Makes this repository compatible with dynamic entity loading.
extension AmmosRepository: AnyEntityRepository {
    func fetchAll() -> AnyPublisher<[any EldenRingEntity], Error> {
        self.fetchAll(limit: 20, page: 0, name: nil, fromFile: true)
            .map { $0.map { $0 as any EldenRingEntity } }
            .eraseToAnyPublisher()
    }
}
