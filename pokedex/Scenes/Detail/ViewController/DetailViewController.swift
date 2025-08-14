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
        setupBackButton()
    }
    
    override func loadView() {
        view = detailView
    }
    
    private func setupBackButton() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
}
