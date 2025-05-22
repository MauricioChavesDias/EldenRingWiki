//
//  Creature.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - Creature

struct Creature: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let location: String
    let drops: [String]
}

// MARK: - Creature API Response

struct CreatureResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Creature]
}

struct SingleCreatureResponse: Decodable {
    let data: Creature?
}

