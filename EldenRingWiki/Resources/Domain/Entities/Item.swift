//
//  Item.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - GameItem

struct Item: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let description: String
    let type: String
    let effect: String
}

// MARK: - GameItem API Response

struct ItemResponse: Codable {
    let success: Bool
    let count: Int
    let data: [Item]
}

struct SingleItemResponse: Decodable {
    let data: Item?
}

