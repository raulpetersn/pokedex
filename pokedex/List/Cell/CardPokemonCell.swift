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
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
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

        NSLayoutConstraint.activate([
            pokemonImage.widthAnchor.constraint(equalToConstant: 94),
            pokemonImage.heightAnchor.constraint(equalToConstant: 94),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: pokemonImage.leadingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        pokemonImage.loadImage(urlString: pokemon.pokemonImage)
    }
    
    func displayPokemonTypeButtons(typeOfPokemon: Pokemon) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        typeOfPokemon.pokemonType.forEach { typePokemon in
            let eachButton = setupRadiusButton(with: typePokemon.capitalized)
            stackView.addArrangedSubview(eachButton)
        }
    }
    
    func setupRadiusButton(with typePokemon: String) -> RadiusButton {
        let typeView = RadiusButton()
        typeView.buttonType.setTitle(typePokemon, for: .normal)
        typeView.buttonType.backgroundColor = .init(hex: "61E5C7")
        return typeView
    }
    
    func updateBackgroundColorByType(pokemon: Pokemon) {
        guard let firstType = pokemon.pokemonType.first,
              let pokemonType = PokemonType(rawValue: firstType.lowercased()) else {
            contentView.backgroundColor = .systemGray 
            return
        }

        contentView.backgroundColor = pokemonType.getColor()
    }
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.pokemonImage.image = image
            }
        }.resume()
    }
}
