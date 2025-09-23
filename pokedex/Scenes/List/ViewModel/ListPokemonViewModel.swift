//
//  ListPokemonViewModel.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//

protocol ListPokemonViewModelDelegate: AnyObject {
    func didUpdatePokemonList()
    func didFailWithError(_ message: String)
    func didUpdatePokemon(at index: Int)
}

class ListPokemonViewModel {
    weak var delegate: ListPokemonViewModelDelegate?
    private let service = PokemonService()
    private(set) var pokemons: [PokemonInfo] = []

    func fetchPokemons() {
        service.fetchPokemonList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons.map { PokemonInfo(pokemon: $0) }
                self.delegate?.didUpdatePokemonList()
                self.fetchPokemonTypes()
            case .failure(let error):
                self.delegate?.didFailWithError(error.localizedDescription)
            }
        }
    }

    func fetchPokemonTypes() {
        for (index, pokemon) in pokemons.enumerated() {
            fetchPokemonType(at: index, pokemonName: pokemon.name)
        }
    }
    
    func fetchPokemonType(at index: Int, pokemonName: String) {
        service.fecthTypeOfPokemons(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.handlePokemonDetail(response, at: index)
            case .failure(let error):
                print("Erro no serviço de type: \(error)")
            }
        }, with: pokemonName)
    }

    func handlePokemonDetail(_ detail: PokemonDetail, at index: Int) {
        let info = PokemonInfo(pokemonDetail: detail)
        pokemons[index] = info
        delegate?.didUpdatePokemon(at: index)
    }

    func getTotalOfPokemons() -> Int {
        return pokemons.count
    }
    
    func pokemon(at index: Int) -> PokemonInfo {
        return pokemons[index]
    }
}

struct PokemonInfo {
    let id: Int
    let name: String
    let height: String
    let weight: String
    let types: [PokemonType]
    let imageUrl: String
    
    init(pokemonDetail: PokemonDetail) {
        self.id = pokemonDetail.id
        self.name = pokemonDetail.name.capitalized
        self.height = pokemonDetail.height.description
        self.weight = pokemonDetail.weight.description
        self.types = pokemonDetail.types
        self.imageUrl = pokemonDetail.imageUrl
    }
    
    init(pokemon: Pokemon) {
        self.id = 0
        self.name = pokemon.name.capitalized
        self.height = ""
        self.weight = ""
        self.types = []
        self.imageUrl = ""
    }
}
