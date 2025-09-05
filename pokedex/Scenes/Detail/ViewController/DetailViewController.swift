//
//  DetailViewController.swift
//  pokedex
//
//  Created by Rauls on 10/06/25.
//

import UIKit

class DetailViewController: UIViewController {	
    
    let detailView = DetailView()
    private var viewModel = DetailViewModel()
    private var pokemonWeak: PokemonDetail
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        viewModel.delegate = self
        detailView.collectionView.delegate = self
        detailView.collectionView.dataSource = self
        viewModel.fetchPokemonWeakness(pokemonType: pokemonWeak)
        detailView.setupTypePill(pokemon: pokemonWeak)
    }
    
    override func loadView() {
        view = detailView
    }
    
    init(pokemonTypeWeakenss: PokemonDetail) {
        self.pokemonWeak = pokemonTypeWeakenss
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackButton() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.detailPokemon?.weaknessType.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PillTypeCell.identifier,
            for: indexPath
        ) as? PillTypeCell else {
            return UICollectionViewCell()
        }

        let type = self.viewModel.detailPokemon?.weaknessType[indexPath.item].name ?? "poison"
        cell.configureCell(typeName: type)

        return cell
    }

}

extension DetailViewController: DetailViewModelDelegate {
    func didUpdatePokemonDetails() {
        DispatchQueue.main.async {
            self.detailView.collectionView.reloadData()
        }
    }    
}
