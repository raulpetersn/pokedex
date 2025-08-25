//
//  ListPokemonViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    private var pokemons: [Pokemon] = []
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
    
    
    private func goToDetailView(pokemon: Pokemon) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        detailVC.detailView.displayPokemonTypeButtons(typeOfPokemon: pokemon)
        
    }
    
    private func setupCollectionView() {
        listPokemonView.collectionView.delegate = self
        listPokemonView.collectionView.dataSource = self
    }
    
}

// MARK: - ViewModel Delegate

extension ListPokemonViewController: ListPokemonViewModelDelegate {
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
        
        let poke = viewModel.pokemon(at: indexPath.row)
        cell.configure(with: poke)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectRow = viewModel.pokemon(at: indexPath.row)
        goToDetailView(pokemon: selectRow)
    }
    
    
}
