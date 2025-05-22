//
//  Incantation.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Incantation

struct Incantation: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let type: String
    let cost: Int
    let slots: Int
    let effects: String
    let requires: [Requirement]
}

// MARK: - Incantation API Response

struct IncantationResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Incantation]
}

struct SingleIncantationResponse: Decodable {
    let data: Incantation?
}

