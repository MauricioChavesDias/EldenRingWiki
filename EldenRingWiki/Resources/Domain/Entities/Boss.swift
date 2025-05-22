//
//  Boss.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - Boss

struct Boss: IdentifiableItem {
    let id: String
    let name: String
    let image: String
    let description: String
    let location: String
    let drops: [String]
    let healthPoints: String
}

// MARK: - Bosses API Response

struct BossResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Boss]
}

struct SingleBossResponse: Decodable {
    let data: Boss?
}

