//
//  ListPokemonViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    private var pokemons: [Pokemon] = []
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
    
    func fetchPokemonList(){
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
        guard let url = URL(string: urlString) else { return }

        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let decode = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = decode.results.compactMap { $0.toDomainModel() }
                    self.collectionView.collectionView.reloadData()
                }
                
                print("Meu Data request \(decode.results.compactMap { $0.pokemonUrl })")
                
            } catch {
                print("Erro na api \(error)")
            }
            
        }.resume()
    }
    
}

extension ListPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.identifier, for: indexPath) as? CardPokemonCell
        else {
            return UICollectionViewCell()
        }
        
        let poke = pokemons[indexPath.row]
        cell.configure(with: poke)
        return cell
    }
    
    
}
