//
//  NPC.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - NPC

struct NPC: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let quote: String
    let location: String
    let role: String
}

// MARK: - NPC API Response

struct NPCResponse: Codable {
    let success: Bool
    let count: Int
    let data: [NPC]
}

struct SingleNPCResponse: Decodable {
    let data: NPC?
}

