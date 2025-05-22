// APIConstants.swift
// EldenRingWiki
//
// Created by Mauricio Chaves Dias on 22/5/2025.
//

enum APIConstants {
    static let baseURL = "https://eldenring.fanapis.com/api"

    enum Endpoints {
        static let ammos = "/ammos"
        static let armors = "/armors"
        static let ashesOfWar = "/ashes"
        static let bosses = "/bosses"
        static let classes = "/classes"
        static let creatures = "/creatures"
        static let incantations = "/incantations"
        static let items = "/items"
        static let locations = "/locations"
        static let npcs = "/npcs"
        static let shields = "/shields"
        static let sorceries = "/sorceries"
        static let spirits = "/spirits"
        static let talismans = "/talismans"
        static let weapons = "/weapons"
    }

    enum Parameters {
        static let page = "page"
        static let limit = "limit"
        static let name = "name"
    }
}
