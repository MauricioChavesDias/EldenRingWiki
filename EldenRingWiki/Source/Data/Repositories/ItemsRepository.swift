
//
//  ItemsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with item data,
/// including API-based and optionally offline file-based loading.
protocol ItemsRepositoryProtocol {
    /// Fetch all items with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Item], Error>

    /// Fetch a item by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Item, Error>
}

// MARK: - Implementation

/// Default implementation of the ItemsRepository using a ItemsService.
class ItemsRepository: ItemsRepositoryProtocol {

    // MARK: - Properties

    private let service: ItemsService

    // MARK: - Initialization

    init(service: ItemsService) {
        self.service = service
    }

    // MARK: - ItemsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Item], Error> {
        return service.fetchItems(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Item, Error> {
        return service.fetchItem(byId: id, fromFile: fromFile)
    }
}
