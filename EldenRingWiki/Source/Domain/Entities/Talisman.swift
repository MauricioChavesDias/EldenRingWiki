//
//  Talisman.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Talisman

struct Talisman: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let effect: String
}

// MARK: - Talisman API Response

struct TalismanResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Talisman]
}

struct SingleTalismanResponse: Decodable {
    let data: Talisman?
}

