//
//  SharedModels.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - Shared Models

struct Stat: Codable {
    let name: String
    let amount: Int
}

struct Scaling: Codable {
    let name: String
    let scaling: String
}

struct Requirement: Codable {
    let name: String
    let amount: Int
}
