
//
//  LocationsUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching locations, supporting both API and local file sources.
protocol LocationsUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Location], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Location, Error>
}

/// Default implementation of the LocationsUseCase that delegates to a repository.
class LocationsUseCaseImpl: LocationsUseCase {

    private let repository: LocationsRepositoryProtocol

    init(repository: LocationsRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Location], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Location, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
