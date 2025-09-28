//
//  PokemonService.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//

final class PokemonService {
    
    let networkClient = NetworkClient()
    
    func fetchPokemonList(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
          
          networkClient.fetch(from: urlString, decodeTo: PokemonListResponse.self) { result in
              switch result {
              case .success(let response):
                  let pokemons = response.results.compactMap{ $0.toDomainModel() }
                  completion(.success(pokemons))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
        
    }
    
    func fecthTypeOfPokemons(completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void,
                             with pokemonName: String) {
        let urlType = "https://pokeapi.co/api/v2/pokemon/\(pokemonName)"
        
        networkClient.fetch(from: urlType, decodeTo: PokemonDetailResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchWeaknessByTypePokemon(completion: @escaping (Result<TypeWeaknessResponse, Error>) -> Void,
                             with pokemonType: String) {
        let urlType = "https://pokeapi.co/api/v2/type/\(pokemonType)"
        
        networkClient.fetch(from: urlType, decodeTo: PokemonWeaknessResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.damageRelation))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}


// MARK: - ServiceError

enum ServiceError: Error {
    case invalidURL
    case emptyData
}
