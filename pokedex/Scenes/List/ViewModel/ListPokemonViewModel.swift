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
    private(set) var pokemonsDetails: [String: PokemonDetail] = [:]
    private(set) var atIndex: Int = 0

    func fetchPokemons() {
        service.fetchPokemonList { [weak self] result in
            guard let self = self else { return}
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
                self.delegate?.didUpdatePokemonList()
                self.filterPokemonType()
            case .failure(let error):
                self.delegate?.didFailWithError(error.localizedDescription)
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
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let detail = response.toDomainModel()
                    self.pokemonsDetails[pokemonName] = detail
//                    self.handlePokemonDetail(with: response.toDomainModel())
                    self.delegate?.didUpdatePokemonList()
                case .failure(let error):
                    print("deu ruim no servico de type \(error)")
                }
            }, with: pokemonName)
    }

    func getTotalOfPokemons() -> Int {
        return pokemons.count
    }
    
    func pokemon(at index: Int) -> Pokemon {
        return pokemons[index]
    }
    
    func handlePokemonDetail(with pokemonDetail: PokemonDetail) {
        let pokemonDetail = PokemonInfo(pokemonDetail: pokemonDetail)
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
}
