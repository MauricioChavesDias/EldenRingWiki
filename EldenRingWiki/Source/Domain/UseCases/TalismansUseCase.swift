
//
//  TalismansUseCase.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Protocol defining the use case for fetching talismans, supporting both API and local file sources.
protocol TalismansUseCase {
    func executeFetchAll(limit: Int, page: Int, name: String?, fromFile: Bool) -> AnyPublisher<[Talisman], Error>
    func executeFetchById(_ id: String, fromFile: Bool) -> AnyPublisher<Talisman, Error>
}

/// Default implementation of the TalismansUseCase that delegates to a repository.
class TalismansUseCaseImpl: TalismansUseCase {

    private let repository: TalismansRepositoryProtocol

    init(repository: TalismansRepositoryProtocol) {
        self.repository = repository
    }

    func executeFetchAll(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Talisman], Error> {
        return repository.fetchAll(limit: limit, page: page, name: name, fromFile: fromFile)
    }

    func executeFetchById(_ id: String, fromFile: Bool = false) -> AnyPublisher<Talisman, Error> {
        return repository.fetchById(id, fromFile: fromFile)
    }
}
