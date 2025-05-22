//
//  Ammo.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - Ammo

struct Ammo: IdentifiableItem {
    struct AttackPower: Codable {
        let name: String
        let amount: Int
    }

    let id: String
    let name: String
    let image: String
    let description: String
    let type: String
    let attackPower: [AttackPower]
    let passive: String
}

// MARK: - Ammo API Response

struct AmmoResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Ammo]
}

struct SingleAmmoResponse: Decodable {
    let data: Ammo?
}

