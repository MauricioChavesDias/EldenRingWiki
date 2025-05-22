//
//  Weapon.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Weapon

struct Weapon: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let attack: [Stat]
    let defence: [Stat]
    let scalesWith: [Scaling]
    let requiredAttributes: [Requirement]
    let category: String
    let weight: Double
}

// MARK: - Weapon API Response

struct WeaponResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Weapon]
}

struct SingleWeaponResponse: Decodable {
    let data: Weapon?
}

