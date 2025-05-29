//
//  AnyEntitiy.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 23/5/2025.
//

import Foundation

struct AnyEntity: Identifiable {
    let id: String
    let title: String

    init(from entity: any EldenRingEntity) {
        self.id = String(describing: entity.id)
        self.title = String(describing: entity)
    }
}
