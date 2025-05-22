//
// AmmosService.swift
// EldenRingWiki
//
// Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

class AmmosService {

    // MARK: - Properties

    private let networkService: NetworkService
    private let endpoint = APIConstants.Endpoints.ammos

    // MARK: - Initialization

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - Public API

    func fetchAmmos(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Ammo], Error> {
        if fromFile {
            return loadAmmosFromFile(filename: "ammos")
        }

        guard let url = URL(string: APIConstants.baseURL + endpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let filter = PaginatedFilter(limit: limit, page: page, name: name)
        return networkService.request(url, method: .GET, filter: filter)
            .map { (response: AmmoResponse) in response.data }
            .eraseToAnyPublisher()
    }

    func fetchAmmo(byId id: String, fromFile: Bool = false) -> AnyPublisher<Ammo, Error> {
        if fromFile {
            return loadAmmoFromFile(filename: "ammo")
        }

        let urlString = APIConstants.baseURL + endpoint + "/\(id)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return networkService.request(url, method: .GET)
            .tryMap { (response: SingleAmmoResponse) in
                guard let item = response.data else {
                    throw URLError(.cannotParseResponse)
                }
                return item
            }
            .eraseToAnyPublisher()
    }

    // MARK: - File Loaders

    private func loadAmmoFromFile(filename: String) -> AnyPublisher<Ammo, Error> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
                    return promise(.failure(URLError(.fileDoesNotExist)))
                }

                do {
                    let data = try Data(contentsOf: url)
                    let response = try JSONDecoder().decode(SingleAmmoResponse.self, from: data)
                    guard let item = response.data else {
                        return promise(.failure(URLError(.cannotParseResponse)))
                    }
                    DispatchQueue.main.async {
                        promise(.success(item))
                    }
                } catch {
                    DispatchQueue.main.async {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }

    private func loadAmmosFromFile(filename: String) -> AnyPublisher<[Ammo], Error> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
                    return promise(.failure(URLError(.fileDoesNotExist)))
                }

                do {
                    let data = try Data(contentsOf: url)
                    let response = try JSONDecoder().decode(AmmoResponse.self, from: data)
                    DispatchQueue.main.async {
                        promise(.success(response.data))
                    }
                } catch {
                    DispatchQueue.main.async {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
