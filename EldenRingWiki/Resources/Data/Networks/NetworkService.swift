//
//  NetworkService.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation
import Combine

/// Enum representing all supported HTTP methods.
/// This helps prevent typos and gives strong typing when specifying request methods.
enum HTTPMethod: String {
    case GET, POST, PUT, DELETE, PATCH
}

/// Extension to simplify appending query parameters to a base URL.
extension URL {
    func appendingQueryItems(_ parameters: [String: String?]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters
            .compactMapValues { $0 } // Remove nil values
            .map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url ?? self
    }
}

/// Represents a common set of pagination and filtering parameters for the Elden Ring API.
/// Centralized in a struct to avoid duplication across services.
struct PaginatedFilter {
    let limit: Int
    let page: Int
    let name: String?

    var asQuery: [String: String?] {
        return [
            "limit": String(limit),
            "page": String(page),
            "name": name
        ]
    }
}

/// Main service responsible for making HTTP requests.
/// Generic and reusable for all endpoints across the app.
class NetworkService {

    /// Dummy struct used for bodyless requests in a type-safe way.
    private struct Empty: Encodable {}

    /// Main method for making HTTP requests.
    ///
    /// - Parameters:
    ///   - url: The endpoint URL.
    ///   - method: HTTP method (GET, POST, etc.).
    ///   - body: Optional encodable body.
    ///   - filter: Optional `PaginatedFilter` for query parameters.
    ///   - headers: Optional HTTP headers (defaults to JSON content type).
    ///
    /// - Returns: A Combine publisher that emits the decoded response or an error.
    func request<T: Decodable, Body: Encodable>(
        _ url: URL,
        method: HTTPMethod = .GET,
        body: Body? = nil,
        filter: PaginatedFilter? = nil,
        headers: [String: String] = ["Content-Type": "application/json"]
    ) -> AnyPublisher<T, Error> {

        // Compose full URL with query parameters if provided
        let query = filter?.asQuery ?? [:]
        let fullURL = url.appendingQueryItems(query)
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue

        // Add headers
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        // Encode body if provided
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }

        // Execute the network request and decode the response
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background)) // Run off the main thread
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Deliver result on main thread
            .eraseToAnyPublisher()
    }

    /// Overloaded method for requests that don’t require a body.
    /// Automatically uses an empty `Encodable` struct to satisfy the generic.
    func request<T: Decodable>(
        _ url: URL,
        method: HTTPMethod = .GET,
        filter: PaginatedFilter? = nil,
        headers: [String: String] = ["Content-Type": "application/json"]
    ) -> AnyPublisher<T, Error> {
        return request(url, method: method, body: Empty(), filter: filter, headers: headers)
    }
}
