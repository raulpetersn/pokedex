//
//  DetailEvolutionTableViewCell.swift
//  pokedex
//
//  Created by Rauls on 06/09/25.
//

import UIKit

class DetailEvolutionTableViewCell: UITableViewCell {
    
    static let identifier = "DetailEvolutionTableViewCell"
    
    lazy var strokeView: UIView = {
        let radiusView = UIView()
        radiusView.translatesAutoresizingMaskIntoConstraints = false
        radiusView.layer.borderColor = UIColor(hex: "7F8CAA").cgColor
        radiusView.layer.borderWidth = 1
        radiusView.clipsToBounds = true
        radiusView.layer.cornerRadius = 40
        
        return radiusView
    }()
    
    lazy var borderRadiusView: UIView = {
        let radiusView = UIView()
        radiusView.translatesAutoresizingMaskIntoConstraints = false
        radiusView.layer.borderColor = UIColor.gray.cgColor
        radiusView.backgroundColor = UIColor(hex: "63BC5A")
        radiusView.clipsToBounds = true
        radiusView.layer.cornerRadius = 40
        
        return radiusView
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "koffing")
        
        return imageView
    }()
    
    lazy var pokemonImageType: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "grass")
        
        return imageView
    }()
    
    lazy var pokemonNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bulbassaur"
        
        return label
    }()
    
  
    lazy var pokemonNumberLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        
        return label
    }()
    
    let typeView = PillView()

    lazy var stackViewPokemonType: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(strokeView)
        contentView.addSubview(borderRadiusView)
        borderRadiusView.addSubview(pokemonImageType)
        borderRadiusView.addSubview(pokemonImage)
        addSubview(pokemonNameLbl)
        addSubview(pokemonNumberLbl)
        addSubview(stackViewPokemonType)
        setupConstrains()
    }
    
    private func setupConstrains() {
        stackViewPokemonType.addArrangedSubview(typeView)
        NSLayoutConstraint.activate([
        
            strokeView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            strokeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            strokeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            strokeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            strokeView.heightAnchor.constraint(equalToConstant: 74),
            
            borderRadiusView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            borderRadiusView.leadingAnchor.constraint(equalTo: strokeView.leadingAnchor),
            borderRadiusView.bottomAnchor.constraint(equalTo: strokeView.bottomAnchor),
            borderRadiusView.widthAnchor.constraint(equalToConstant: 112),
            borderRadiusView.heightAnchor.constraint(equalToConstant: 74),
            
            pokemonImageType.centerXAnchor.constraint(equalTo: borderRadiusView.centerXAnchor),
            pokemonImageType.centerYAnchor.constraint(equalTo: borderRadiusView.centerYAnchor),
            pokemonImageType.widthAnchor.constraint(equalToConstant: 64),
            pokemonImageType.heightAnchor.constraint(equalToConstant: 64),
            
            pokemonNameLbl.topAnchor.constraint(equalTo: borderRadiusView.topAnchor, constant: 4),
            pokemonNameLbl.leadingAnchor.constraint(equalTo: borderRadiusView.trailingAnchor, constant: 8),

            pokemonNumberLbl.topAnchor.constraint(equalTo: pokemonNameLbl.bottomAnchor, constant: 4),
            pokemonNumberLbl.leadingAnchor.constraint(equalTo: borderRadiusView.trailingAnchor, constant: 8),
            
            pokemonImage.widthAnchor.constraint(equalToConstant: 48),
            pokemonImage.heightAnchor.constraint(equalToConstant: 48),
            
            pokemonImage.centerYAnchor.constraint(equalTo: borderRadiusView.centerYAnchor),
            pokemonImage.centerXAnchor.constraint(equalTo: borderRadiusView.centerXAnchor),
            
            stackViewPokemonType.topAnchor.constraint(equalTo: pokemonNumberLbl.bottomAnchor, constant: 4),
            stackViewPokemonType.leadingAnchor.constraint(equalTo: borderRadiusView.trailingAnchor, constant: 8),
            stackViewPokemonType.trailingAnchor.constraint(equalTo: strokeView.trailingAnchor, constant: -40),
            stackViewPokemonType.bottomAnchor.constraint(equalTo: strokeView.bottomAnchor, constant: -8),

        ])
    }
    
    func configureCell(pokemon: PokemonDetailWeakness) {
        pokemonNameLbl.text = pokemon.name
        pokemonNumberLbl.text = pokemon.id.description
        let pillStyle: PillStyle = pokemon.types.count == 1 ? .singleType : .multiType
        stackViewPokemonType.setupStackViewPills(with: pokemon.types, style: pillStyle)
    }
}
