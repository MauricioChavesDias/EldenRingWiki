//
//  BossesService.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//




import Foundation
import Combine

class BossesService {

    // MARK: - Properties
    private let networkService: NetworkService
    private let endpointURL: String = APIConstants.baseURL + APIConstants.Endpoints.bosses


    // MARK: - Initialization
    init(networkService: NetworkService) {
        self.networkService = networkService
    }


    // MARK: - Public API
    func fetchBosses(limit: Int = 20, page: Int = 0, name: String? = nil) -> AnyPublisher<[Boss], Error> {
        guard let url = URL(string: endpointURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let filter = PaginatedFilter(limit: limit, page: page, name: name)
        return networkService.request(url, method: .GET, filter: filter)
            .map { (response: BossResponse) in response.data }
            .eraseToAnyPublisher()
    }

    func fetchBoss(byId bossId: String) -> AnyPublisher<Boss, Error> {
        let urlString = "\(endpointURL)/\(bossId)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return networkService.request(url, method: .GET)
            .tryMap { (response: SingleBossResponse) in
                guard let boss = response.data else {
                    throw URLError(.cannotParseResponse)
                }
                return boss
            }
            .eraseToAnyPublisher()
    }
}
