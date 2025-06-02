//
//  HomeView.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class HomeView: UIView {
    
     lazy var cellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Celula", for: .normal)
//        button.addTarget(self, action: #selector(goToCellPreview), for: .touchUpInside)
        return button
    }()

     lazy var listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("List", for: .normal)
//        button.addTarget(self, action: #selector(goToList), for: .touchUpInside)
        return button
    }()

     lazy var detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Detalhe do pokemon", for: .normal)
//        button.addTarget(self, action: #selector(goToPokemonDetail), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cellButton, listButton, detailButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        addSubview(stackView)
        setupConstrains()
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    

}
