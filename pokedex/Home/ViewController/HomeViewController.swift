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
    }
    
    override func loadView() {
        view = homeView
    }
    
    private func goToList() {
        homeView.listButton.addTarget(self, action: #selector(goToPokemonDetail), for: .touchUpInside)
    }
    
    @objc
    private func goToPokemonDetail() {
        navigationController?.pushViewController(ListPokemonViewController(), animated: true)
    }

}

