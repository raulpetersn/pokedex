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
                    print("deu bom no \(response) type")

                    if let index = self.pokemons.firstIndex(where: { $0.name == pokemonName}) {
                        let currentPokemon = self.pokemons[index]
                        let updatePokemon = Pokemon(
                            name: currentPokemon.name,
                            number: currentPokemon.number,
                            pokemonImage: currentPokemon.pokemonImage,
                            pokemonUrl: currentPokemon.pokemonUrl,
                            pokemonType: response)
                        
                        self.pokemons[index] = updatePokemon
                    }
                    
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
    
}
