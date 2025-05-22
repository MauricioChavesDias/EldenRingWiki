//
//  Spirit.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

import Foundation

// MARK: - Spirit

struct Spirit: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let fpCost: String
    let hpCost: String
    let effect: String
}

// MARK: - Spirit API Response

struct SpiritResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Spirit]
}

struct SingleSpiritResponse: Decodable {
    let data: Spirit?
}

