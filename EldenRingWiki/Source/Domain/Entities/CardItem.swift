//
//  CardItem.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//


import Foundation

enum CardItemType: String {
    case armors = "Armors"
    case ammos = "Ammos"
    case ashesOfWar = "AshesOfWar"
    case bosses = "Bosses"
    case classes = "Classes"
    case creatures = "Creatures"
    case incantations = "Incantations"
    case items = "Items"
    case locations = "Locations"
    case npcs = "NPCs"
    case shields = "Shields"
    case sorceries = "Sorceries"
    case spirits = "Spirits"
    case talismans = "Talismans"
    case weapons = "Weapons"
}

struct CardItem: Identifiable, Hashable {
    var title: String
    var image: String
    var selectedCard: CardItemType
    var id: String { title }
}

