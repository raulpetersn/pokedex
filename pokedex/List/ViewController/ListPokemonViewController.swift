//
//  ListPokemonViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    let collectionView = ListPokemonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.collectionView.delegate = self
        collectionView.collectionView.dataSource = self
    }
    
    override func loadView() {
        view = collectionView
    }
}

extension ListPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.identifier, for: indexPath) as? CardPokemonCell
        else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
