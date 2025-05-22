
//
//  LocationsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with location data,
/// including API-based and optionally offline file-based loading.
protocol LocationsRepositoryProtocol {
    /// Fetch all locations with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Location], Error>

    /// Fetch a location by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Location, Error>
}

// MARK: - Implementation

/// Default implementation of the LocationsRepository using a LocationsService.
class LocationsRepository: LocationsRepositoryProtocol {

    // MARK: - Properties

    private let service: LocationsService

    // MARK: - Initialization

    init(service: LocationsService) {
        self.service = service
    }

    // MARK: - LocationsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Location], Error> {
        return service.fetchLocations(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Location, Error> {
        return service.fetchLocation(byId: id, fromFile: fromFile)
    }
}
