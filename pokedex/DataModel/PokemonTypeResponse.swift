//
//  PokemonTypeResponse.swift
//  pokedex
//
//  Created by Rauls on 03/06/25.
//

import Foundation

struct PokemonTypeResponse: Decodable {

    let types: [Types]
}

struct Types: Decodable {
    let type: type
    
}

struct type: Decodable {
    let name: String
}
