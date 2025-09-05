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
    var detailPokemon: PokemonDetailWeakness? = nil
    
    func fetchPokemonWeakness(pokemonType: PokemonDetail) {
       
        service.fetchWeaknessByTypePokemon(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonWeakness):
                print("deu bom no weak \(pokemonWeakness.doubleDamageFrom)")
                let updatedPokemonWeakness = PokemonDetailWeakness(id: pokemonType.id,
                                                  name: pokemonType.name,
                                                  height: pokemonType.height.description,
                                                  weight: pokemonType.weight.description,
                                                  types: pokemonType.types,
                                                  imageUrl: pokemonType.imageUrl,
                                                  weaknessType: pokemonWeakness.doubleDamageFrom)
                self.detailPokemon = updatedPokemonWeakness
                self.delegate?.didUpdatePokemonDetails()
            case .failure(let error):
                print("deu ruim no weak \(error)")
            }
        }, with: pokemonType.types.first?.rawValue ?? "poison")
    }
}

struct PokemonDetailWeakness {
    let id: Int
    let name: String
    let height: String
    let weight: String
    let types: [PokemonType]
    let imageUrl: String
    let weaknessType: [DoubleDamageFrom]
    
    init(id: Int,
         name: String,
         height: String,
         weight: String,
         types: [PokemonType],
         imageUrl: String,
         weaknessType: [DoubleDamageFrom])
    {
        self.id = id
        self.name = name.capitalized
        self.height = height.description
        self.weight = weight.description
        self.types = types
        self.imageUrl = imageUrl
        self.weaknessType = weaknessType
    }
}
