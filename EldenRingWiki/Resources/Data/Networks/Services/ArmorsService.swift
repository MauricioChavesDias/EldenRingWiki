
//
//  ArmorsService.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

class ArmorsService {

    // MARK: - Properties

    private let networkService: NetworkService
    private let endpointURL = APIConstants.baseURL + APIConstants.Endpoints.armors

    // MARK: - Initialization
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - Public API
    func fetchArmors(limit: Int = 20, page: Int = 0, name: String? = nil, fromFile: Bool = false) -> AnyPublisher<[Armor], Error> {
        if fromFile {
            return loadArmorsFromFile(filename: "armors")
        }

        guard let url = URL(string: endpointURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let filter = PaginatedFilter(limit: limit, page: page, name: name)
        return networkService.request(url, method: .GET, filter: filter)
            .map { (response: ArmorResponse) in response.data }
            .eraseToAnyPublisher()
    }

    func fetchArmor(byId id: String, fromFile: Bool = false) -> AnyPublisher<Armor, Error> {
        if fromFile {
            return loadArmorFromFile(filename: "armor")
        }

        let urlString = "\(endpointURL)/\(id)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return networkService.request(url, method: .GET)
            .tryMap { (response: SingleArmorResponse) in
                guard let item = response.data else {
                    throw URLError(.cannotParseResponse)
                }
                return item
            }
            .eraseToAnyPublisher()
    }

    // MARK: - File Loader
    func loadArmorFromFile(filename: String) -> AnyPublisher<Armor, Error> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
                    return promise(.failure(URLError(.fileDoesNotExist)))
                }

                do {
                    let data = try Data(contentsOf: url)
                    let response = try JSONDecoder().decode(SingleArmorResponse.self, from: data)
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

    // MARK: - File Loader
    func loadArmorsFromFile(filename: String) -> AnyPublisher<[Armor], Error> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
                    return promise(.failure(URLError(.fileDoesNotExist)))
                }

                do {
                    let data = try Data(contentsOf: url)
                    let response = try JSONDecoder().decode(ArmorResponse.self, from: data)
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
