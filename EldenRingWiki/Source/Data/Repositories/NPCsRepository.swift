
//
//  NPCsRepository.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

// MARK: - Protocol

/// Protocol defining the interface for interacting with npc data,
/// including API-based and optionally offline file-based loading.
protocol NPCsRepositoryProtocol {
    /// Fetch all npcs with optional pagination, name filtering, and offline mode.
    func fetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[NPC], Error>

    /// Fetch a npc by its unique identifier with optional offline mode.
    func fetchById(_ id: String, fromFile: Bool) -> AnyPublisher<NPC, Error>
}

// MARK: - Implementation

/// Default implementation of the NPCsRepository using a NPCsService.
class NPCsRepository: NPCsRepositoryProtocol {

    // MARK: - Properties

    private let service: NPCsService

    // MARK: - Initialization

    init(service: NPCsService) {
        self.service = service
    }

    // MARK: - NPCsRepositoryProtocol

    func fetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[NPC], Error> {
        return service.fetchNPCs(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func fetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<NPC, Error> {
        return service.fetchNPC(byId: id, fromFile: fromFile)
    }
}
