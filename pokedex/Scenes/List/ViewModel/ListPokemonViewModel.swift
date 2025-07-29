//
//  ListPokemonViewModel.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//

protocol ListPokemonViewModelDelegate: AnyObject {
    func didUpdatePokemonList()
    func didFailWithError(_ message: String)
}

class ListPokemonViewModel {

    weak var delegate: ListPokemonViewModelDelegate?
    private let service = PokemonService()
    private(set) var pokemons: [Pokemon] = []

    func fetchPokemons() {
        service.fetchPokemonList { [weak self] result in
            switch result {
            case .success(let pokemons):
                self?.pokemons = pokemons
                self?.delegate?.didUpdatePokemonList()
            case .failure(let error):
                self?.delegate?.didFailWithError(error.localizedDescription)
            }
        }
    }

    func filterPokemonType() {
        for pokemon in pokemons {
            fetchPokemonType(pokemonName: pokemon.name)
        }
    }
    
    func fetchPokemonType(pokemonName: String) {
        service.fecthTypeOfPokemons(
            completion: { [weak self] result in
                switch result {
                case .success(let response):
              
                    self?.delegate?.didUpdatePokemonList()
                case .failure(let error):
                    print("deu ruim no pokemon type")
                }
            }, with: pokemonName)
    }
    
    
    func getTotalOfPokemons() -> Int {
        return pokemons.count
    }
}
