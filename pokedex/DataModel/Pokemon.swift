//
//  Pokemon.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//
import Foundation

struct Pokemon {
    let name: String
    let number: Int
    let pokemonImage: String
    let pokemonUrl: URL?
    let pokemonType: [String]
}

extension Pokemon {
    static func mock() -> Pokemon {
        return Pokemon(name: "Koffing", number: 109, pokemonImage: "koffing", pokemonUrl: nil, pokemonType: ["fogo"])
    }
}
