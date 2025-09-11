//
//  DetailEvolutionCell.swift
//  pokedex
//
//  Created by Rauls on 06/09/25.
//

import UIKit

class DetailEvolutionCell: UITableViewCell {
    
    static let identifier = "DetailEvolutionCell"
    
    lazy var strokeView: UIView = {
        let radiusView = UIView()
        radiusView.translatesAutoresizingMaskIntoConstraints = false
        radiusView.layer.borderColor = UIColor.gray.cgColor
        radiusView.layer.borderWidth = 1
        radiusView.clipsToBounds = true
        radiusView.layer.cornerRadius = 40
        
        return radiusView
    }()
    
    lazy var borderRadiusView: UIView = {
        let radiusView = UIView()
        radiusView.translatesAutoresizingMaskIntoConstraints = false
        radiusView.layer.borderColor = UIColor.black.cgColor
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        
        contentView.addSubview(strokeView)
        contentView.addSubview(borderRadiusView)
        borderRadiusView.addSubview(pokemonImageType)
        addSubview(pokemonNameLbl)
        addSubview(pokemonNumberLbl)
        borderRadiusView.addSubview(pokemonImage)
        setupConstrains()
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
        
            strokeView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            strokeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            strokeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            strokeView.heightAnchor.constraint(equalToConstant: 74),
            strokeView.widthAnchor.constraint(equalToConstant: 196),
            
            borderRadiusView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            borderRadiusView.leadingAnchor.constraint(equalTo: strokeView.leadingAnchor),
//            borderRadiusView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            borderRadiusView.widthAnchor.constraint(equalToConstant: 96),
            borderRadiusView.heightAnchor.constraint(equalToConstant: 74),
            
            pokemonImageType.centerXAnchor.constraint(equalTo: borderRadiusView.centerXAnchor),
            pokemonImageType.centerYAnchor.constraint(equalTo: borderRadiusView.centerYAnchor),
            pokemonImageType.widthAnchor.constraint(equalToConstant: 56),
            pokemonImageType.heightAnchor.constraint(equalToConstant: 56),
            
            pokemonNameLbl.topAnchor.constraint(equalTo: borderRadiusView.topAnchor, constant: 8),
            pokemonNameLbl.leadingAnchor.constraint(equalTo: borderRadiusView.trailingAnchor, constant: 8),

            pokemonNumberLbl.topAnchor.constraint(equalTo: pokemonNameLbl.bottomAnchor, constant: 8),
            pokemonNumberLbl.leadingAnchor.constraint(equalTo: borderRadiusView.trailingAnchor, constant: 8),
            
            pokemonImage.widthAnchor.constraint(equalToConstant: 64),
            pokemonImage.heightAnchor.constraint(equalToConstant: 64),
            
            pokemonImage.centerYAnchor.constraint(equalTo: borderRadiusView.centerYAnchor),
            pokemonImage.centerXAnchor.constraint(equalTo: borderRadiusView.centerXAnchor),

        ])
    }
    
    func configureCell() {
        pokemonNameLbl.text = "Bulbassaur"
        pokemonNumberLbl.text = "01"
    }
}
