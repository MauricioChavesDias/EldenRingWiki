//
//  Location.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Location

struct Location: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
}

// MARK: - Location API Response

struct LocationResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Location]
}

struct SingleLocationResponse: Decodable {
    let data: Location?
}

