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

struct CardItem: Identifiable, Hashable, CaseIterable {
    static var allCases: [CardItem] {
        [CardItem(title: "Ammos", image: "ammo", selectedCard: .ammos),
         CardItem(title: "Armors", image: "armor", selectedCard: .armors),
         CardItem(title: "Classes", image: "class", selectedCard: .classes),
         CardItem(title: "Creatures", image: "creature", selectedCard: .creatures),
         CardItem(title: "Bosses", image: "boss", selectedCard: .bosses),
         CardItem(title: "Incantations", image: "incantation", selectedCard: .incantations),
         CardItem(title: "Items", image: "item", selectedCard: .items),
         CardItem(title: "Locations", image: "location", selectedCard: .locations),
         CardItem(title: "NPCs", image: "npc", selectedCard: .npcs),
         CardItem(title: "Shields", image: "shield", selectedCard: .shields),
         CardItem(title: "Sorceries", image: "sorcery", selectedCard: .sorceries),
         CardItem(title: "Spirits", image: "spirit", selectedCard: .spirits),
         CardItem(title: "Talismans", image: "talisman", selectedCard: .talismans),
         CardItem(title: "Weapons", image: "weapon", selectedCard: .weapons)]
    }
    
    var title: String
    var image: String
    var selectedCard: CardItemType

    var id: String { title }
}


