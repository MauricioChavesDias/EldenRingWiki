//
//  armor.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Armor

struct Armor: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let category: String
    let dmgNegation: [Stat]
    let resistance: [Stat]
    let weight: Double
}

// MARK: - Armor API Response

struct ArmorResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Armor]
}

struct SingleArmorResponse: Decodable {
    let data: Armor?
}

