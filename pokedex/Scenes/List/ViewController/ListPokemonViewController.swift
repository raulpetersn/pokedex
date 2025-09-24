//
//  ListPokemonViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    let listPokemonView = ListPokemonView()
    private var viewModel = ListPokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCollectionView()
        viewModel.delegate = self
        viewModel.fetchPokemons()
    }
    
    override func loadView() {
        view = listPokemonView
    }
    
    
    private func goToDetailView(pokemonInfo: PokemonInfo) {
        let detailVC = DetailViewController(pokemonInfo: pokemonInfo)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    private func setupCollectionView() {
        listPokemonView.collectionView.delegate = self
        listPokemonView.collectionView.dataSource = self
    }
    
}

// MARK: - ViewModel Delegate

extension ListPokemonViewController: ListPokemonViewModelDelegate {
    
    func didUpdatePokemon(at index: Int) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: index, section: 0)
            self.listPokemonView.collectionView.reloadItems(at: [indexPath])
        }
        
    }
    
    func didUpdatePokemonList() {
           DispatchQueue.main.async {
               self.listPokemonView.collectionView.reloadData()
           }
       }

       func didFailWithError(_ message: String) {
           DispatchQueue.main.async {
//               self.showAlert(message: "Erro ao carregar lista \(message)")
           }
       }
}

extension ListPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTotalOfPokemons()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.identifier, for: indexPath) as? CardPokemonCell else {
            return UICollectionViewCell()
        }
        
        let pokemonInfo = viewModel.pokemon(at: indexPath.row)
        cell.configure(pokeDetail: pokemonInfo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let pokemonInfoAtRow = viewModel.pokemons[indexPath.row]
        goToDetailView(pokemonInfo: pokemonInfoAtRow)
    }
}
