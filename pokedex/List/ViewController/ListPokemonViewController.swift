//
//  ListPokemonViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    private var pokemons: [Pokemon] = []
    var filterPokemon: [String: [String]] = [:]
    let collectionView = ListPokemonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.collectionView.delegate = self
        collectionView.collectionView.dataSource = self
        fetchPokemonList()
    }
    
    override func loadView() {
        view = collectionView
    }
    
    private func fetchPokemonList() {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let decode = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = decode.results.compactMap { $0.toDomainModel() }
                    self.collectionView.collectionView.reloadData()
                    self.filterEachTypePokemon()
                }
            } catch {
                print("Erro na api \(error)")
            }
            
        }.resume()
        
    }
    
    
    private func filterEachTypePokemon() {
        for pokemon in pokemons {
            fetchPokemonTypes(with: pokemon.name)
        }
    }
    
    private func fetchPokemonTypes(with pokemonName: String) {
        let urlType = "https://pokeapi.co/api/v2/pokemon/\(pokemonName)"
        guard let url = URL(string: urlType) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(PokemonTypeResponse.self, from: data)
                let eachType = result.types.map { type in type.type.name }
                
                DispatchQueue.main.async {
                    if let index = self.pokemons.firstIndex(where: { $0.name == pokemonName }) {
                        let currentPokemon = self.pokemons[index]
                     
                        let updatedPokemon = Pokemon(
                            name: currentPokemon.name,
                            number: currentPokemon.number,
                            pokemonImage: currentPokemon.pokemonImage,
                            pokemonUrl: currentPokemon.pokemonUrl,
                            pokemonType: eachType
                        )
                        
                        self.pokemons[index] = updatedPokemon
                        
                        let indexPath = IndexPath(item: index, section: 0)
                        self.collectionView.collectionView.reloadItems(at: [indexPath])
                    }
                }
            } catch {
                print("error no fetchPokemonTypes \(error)")
            }
        }.resume()
    }
    
}

extension ListPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.identifier, for: indexPath) as? CardPokemonCell else {
            return UICollectionViewCell()
        }
        
        let poke = pokemons[indexPath.row]
        cell.configure(with: poke)
        
        cell.displayPokemonTypeButtons(typeOfPokemon: poke)
        cell.updateBackgroundColorByType(pokemon: poke)
        
        return cell
    }
    
    
}
