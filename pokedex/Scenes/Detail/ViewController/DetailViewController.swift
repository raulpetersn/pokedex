//
//  DetailViewController.swift
//  pokedex
//
//  Created by Rauls on 10/06/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = detailView
    }
}
