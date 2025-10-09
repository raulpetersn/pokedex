//
//  DetailViewModel.swift
//  pokedex
//
//  Created by Rauls on 02/09/25.
//

import UIKit

protocol DetailViewModelDelegate: AnyObject {
    func didUpdatePokemonDetails()
}

class DetailViewModel {
    
    private let service = PokemonService()
    weak var delegate: DetailViewModelDelegate?
    var detailPokemon: PokemonDetailWeakness = PokemonDetailWeakness.mock()
    private(set) var pokemonDetailWeakness: [PokemonInfo] = []

    func fetchPokemonWeakness(pokemonType: PokemonInfo) {
        service.fetchWeaknessByTypePokemon(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonWeakness):
                let updatedDetail = PokemonDetailWeakness(from: pokemonWeakness,
                                                          basePokemon: pokemonType)
                detailPokemon = updatedDetail
                delegate?.didUpdatePokemonDetails()
            case .failure(let error):
                print("erro no endpoint fetchWeaknessByTypePokemon \(error)")
            }
        }, with: pokemonType.types.first?.rawValue ?? "")
    }
    
    func numberOfWeakness() -> Int {
        if detailPokemon.weaknessType.count > 4 {
            return 4
        }
        return detailPokemon.weaknessType.count
    }
    
    func weaknessName(at index: Int) -> String {
        return detailPokemon.weaknessType[index].name
    }
}

struct PokemonDetailWeakness: Decodable {
    let id: Int
    let name: String
    let height: String
    let weight: String
    let types: [PokemonType]
    let imageUrl: String
    let weaknessType: [DoubleDamageFrom]

    init(from response: TypeWeaknessResponse?, basePokemon: PokemonInfo) {
        self.id = basePokemon.id
        self.name = basePokemon.name.capitalized
        self.height = basePokemon.height.description
        self.weight = basePokemon.weight.description
        self.types = basePokemon.types
        self.imageUrl = basePokemon.imageUrl
        self.weaknessType = response?.doubleDamageFrom ?? []
    }
    
    static func mock() -> PokemonDetailWeakness {
        let pokemon = Pokemon.mock()
        let teste = PokemonInfo(pokemon: pokemon)
        return PokemonDetailWeakness(from: nil, basePokemon: teste)
    }
    
}
