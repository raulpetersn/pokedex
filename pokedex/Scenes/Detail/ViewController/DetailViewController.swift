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
    private var pokemonInfo: PokemonInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        setupDelegates()
        viewModel.delegate = self
        viewModel.fetchPokemonWeakness(pokemonType: pokemonInfo)
        detailView.setupEvolutionsPills(pokemon: pokemonInfo)
    }
    
    override func loadView() {
        view = detailView
    }
    
    init(pokemonInfo: PokemonInfo) {
        self.pokemonInfo = pokemonInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDelegates() {
        detailView.collectionView.delegate = self
        detailView.collectionView.dataSource = self
        
        detailView.tableView.dataSource = self
        detailView.tableView.dataSource = self
    }
    
    private func setupBackButton() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
}

extension DetailViewController: DetailViewModelDelegate {
    func didUpdatePokemonDetails() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.detailView.tableView.reloadData()
            self.detailView.collectionView.reloadData()
            
            self.detailView.updateTableAndCollectionHeight()
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfWeakness()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailWeaknessCollectionViewCell.identifier,
            for: indexPath
        ) as? DetailWeaknessCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        let type = viewModel.weaknessName(at: indexPath.row)
        UIView.animate(withDuration: 0.3) {
            cell.pillView.layoutIfNeeded()
        }
        cell.configureCell(typeName: type, isLarge: true)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           cell.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
           
           UIView.animate(withDuration: 0.3) {
               cell.alpha = 1
               cell.transform = .identity
           }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailEvolutionTableViewCell.identifier, for: indexPath) as? DetailEvolutionTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemonInfoDetails = viewModel.detailPokemon
        
        cell.configureCell(pokemon: pokemonInfoDetails)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
