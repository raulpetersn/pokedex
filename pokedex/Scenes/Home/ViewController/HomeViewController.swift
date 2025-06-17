//
//  ViewController.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        goToList()
        goToDetail()
    }
    
    override func loadView() {
        view = homeView
    }
    
    private func goToList() {
        homeView.listButton.addTarget(self, action: #selector(goToPokedex), for: .touchUpInside)
    }
    
    private func goToDetail() {
        homeView.detailButton.addTarget(self, action: #selector(goToPokemonDetail), for: .touchUpInside)
    }
    
    @objc
    private func goToPokedex() {
        navigationController?.pushViewController(ListPokemonViewController(), animated: true)
    }
    
    @objc
    private func goToPokemonDetail() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}

