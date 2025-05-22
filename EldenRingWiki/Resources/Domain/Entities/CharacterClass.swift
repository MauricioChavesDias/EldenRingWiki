//
//  Class.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - CharacterClass

struct CharacterClass: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let stats: CharacterStats
}

// MARK: - Character Stats

struct CharacterStats: Codable {
    let level: String
    let vigor: String
    let mind: String
    let endurance: String
    let strength: String
    let dexterity: String
    let inteligence: String
    let faith: String
    let arcane: String
}

// MARK: - CharacterClass API Response

struct CharacterClassResponse: Codable {
    let success: Bool
    let count: Int
    let data: [CharacterClass]
}

struct SingleCharacterClassResponse: Decodable {
    let data: CharacterClass?
}

