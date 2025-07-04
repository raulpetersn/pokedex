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
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pokeballBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pokeball_background")?.withTintColor(.white.withAlphaComponent(0.3))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(pokeballBackground)
        contentView.addSubview(pokemonImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(stackView)
        contentView.clipsToBounds = true

        NSLayoutConstraint.activate([
            
            pokeballBackground.widthAnchor.constraint(equalToConstant: 104),
            pokeballBackground.heightAnchor.constraint(equalToConstant: 104),
            pokeballBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            pokeballBackground.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            pokemonImage.widthAnchor.constraint(equalToConstant: 96),
            pokemonImage.heightAnchor.constraint(equalToConstant: 96),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
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
        typeView.buttonType.backgroundColor = .white.withAlphaComponent(0.2)
        return typeView
    }
    
    func updateBackgroundColorByType(pokemon: Pokemon) {
        guard let firstType = pokemon.pokemonType.first,
              let pokemonType = PokemonType(rawValue: firstType.lowercased()) else { return }

        contentView.backgroundColor = pokemonType.getColor()
        self.pokeballBackground.image = pokemonType.getBackgroundImageType()
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
