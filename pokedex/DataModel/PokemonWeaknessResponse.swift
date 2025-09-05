//
//  PokemonWeaknessResponse.swift
//  pokedex
//
//  Created by Rauls on 01/09/25.
//

import Foundation

struct PokemonWeaknessResponse: Decodable {
    
    let damageRelation: TypeWeaknessResponse
    
    enum CodingKeys: String, CodingKey {
         case damageRelation = "damage_relations"
     }
}

struct TypeWeaknessResponse: Decodable {
    
    let doubleDamageFrom: [DoubleDamageFrom]
    let halfDamageFrom: [HalfDamageFrom]
    
    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case halfDamageFrom = "half_damage_from"
    }
}

struct DoubleDamageFrom: Codable {
    let name: String
    let url: String
}


struct HalfDamageFrom: Codable {
    let name: String
}
