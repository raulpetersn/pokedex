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
    }
    
    override func loadView() {
        view = homeView
    }

}

