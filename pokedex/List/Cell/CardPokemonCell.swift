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
        label.text = "Koffing"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "koffing")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .init(hex: "49D0B0")
        contentView.layer.cornerRadius = 8
        contentView.addSubview(pokemonImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(stackView)
       
        radiusTypeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pokemonImage.widthAnchor.constraint(equalToConstant: 64),
            pokemonImage.heightAnchor.constraint(equalToConstant: 64),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: pokemonImage.leadingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        applyTypePokemon(typeOfPokemon: ["veneno", "grama"])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyTypePokemon(typeOfPokemon: [String]) {
        typeOfPokemon.forEach { typePokemon in
            let eachButton = setupRadiusButton(with: typePokemon)
            stackView.addArrangedSubview(eachButton)
        }
    }
    
    func setupRadiusButton(with typePokemon: String) -> RadiusButton {
        let typeView = RadiusButton()
        typeView.buttonType.setTitle(typePokemon, for: .normal)
        typeView.buttonType.backgroundColor = .init(hex: "61E5C7")
        return typeView
    }
}
