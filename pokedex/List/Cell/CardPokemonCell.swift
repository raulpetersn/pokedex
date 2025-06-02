//
//  CardPokemonCell.swift
//  pokedex
//
//  Created by Rauls on 31/05/25.
//

import UIKit

class CardPokemonCell: UICollectionViewCell {
    
    static let identifier = "PokemonCell"

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokémon"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 8
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with name: String) {
        nameLabel.text = name
    }
}
