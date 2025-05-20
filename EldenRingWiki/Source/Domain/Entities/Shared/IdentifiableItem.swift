//
//  IdentifiableItem.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 20/5/2025.
//

// MARK: - Common Protocols

protocol IdentifiableItem: Identifiable, Codable {
    var id: String { get }
    var name: String { get }
    var image: String { get }
    var description: String { get }
}
