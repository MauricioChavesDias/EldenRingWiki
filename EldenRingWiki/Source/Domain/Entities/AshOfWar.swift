//
//  Ash.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - AshOfWar

struct AshOfWar: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let affinity: String
    let skill: String
}

// MARK: - AshOfWar API Response

struct AshOfWarResponse: Codable {
    let success: Bool
    let count: Int
    let data: [AshOfWar]
}

struct SingleAshOfWarResponse: Decodable {
    let data: AshOfWar?
}

