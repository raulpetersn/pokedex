//
//  DetailView.swift
//  pokedex
//
//  Created by Rauls on 10/06/25.
//

import UIKit

class DetailView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.layer.cornerRadius = 24
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    lazy var pokemonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bulba"
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    lazy var pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nº 001"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let pokemonWeaknessType = PillView()
    
    lazy var stackViewPokemonType: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
    
        return stack
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "koffing")
        return image
    }()

    let attributeWeight = Atributes(titleAttibute: "Peso", descriptionAtrribute: "33", icon: .weight)
    let attributeCategory = Atributes(titleAttibute: "Altura", descriptionAtrribute: "33", icon: .category)
    let attributeSkill = Atributes(titleAttibute: "Categoria", descriptionAtrribute: "33", icon: .skill)
    let attributeHeight = Atributes(titleAttibute: "Habilidade", descriptionAtrribute: "33", icon: .height)
    
    lazy var stackViewLeft = {
        let stack = UIStackView(arrangedSubviews: [attributeWeight,attributeCategory])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    lazy var stackViewRight = {
        let stack = UIStackView(arrangedSubviews: [attributeSkill,attributeHeight])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    lazy var aboutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var weaknessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fraquezas"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var stackViewWeakness: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.backgroundColor = .red
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 36)
        layout.sectionInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PillTypeCell.self, forCellWithReuseIdentifier: PillTypeCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func setupView() {
        pokemonWeaknessType.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.addSubview(scrollView)
        scrollView.addSubview(bottomView)
        bottomView.addSubview(pokemonTitleLabel)
        bottomView.addSubview(pokemonNumberLabel)
        contentView.addSubview(pokemonImage)
        bottomView.addSubview(stackViewPokemonType)
        bottomView.addSubview(aboutView)
        aboutView.addSubview(stackViewLeft)
        aboutView.addSubview(stackViewRight)
        bottomView.addSubview(weaknessLabel)
//        bottomView.addSubview(stackViewWeakness)
        bottomView.addSubview(collectionView)

        setupConstrains()
        attributeWeight.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            bottomView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            bottomView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            bottomView.widthAnchor.constraint(equalTo: widthAnchor),
            bottomView.heightAnchor.constraint(equalTo: heightAnchor),
            
            pokemonTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pokemonTitleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
         
            pokemonNumberLabel.topAnchor.constraint(equalTo: pokemonTitleLabel.bottomAnchor, constant: 8),
            pokemonNumberLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
            pokemonImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 144),
            pokemonImage.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 154),
            pokemonImage.heightAnchor.constraint(equalToConstant: 154),
                        
            stackViewPokemonType.heightAnchor.constraint(equalToConstant: 40),
            stackViewPokemonType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -136),
            stackViewPokemonType.topAnchor.constraint(equalTo: pokemonNumberLabel.bottomAnchor, constant: 16),
            stackViewPokemonType.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),

            aboutView.topAnchor.constraint(equalTo: stackViewPokemonType.bottomAnchor, constant: 16),
            aboutView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            aboutView.heightAnchor.constraint(equalToConstant: 132),
            
            stackViewLeft.topAnchor.constraint(equalTo: aboutView.topAnchor),
            stackViewLeft.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor),
            stackViewLeft.widthAnchor.constraint(equalToConstant: 154),
            
            stackViewRight.topAnchor.constraint(equalTo: aboutView.topAnchor),
            stackViewRight.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor),
            stackViewRight.trailingAnchor.constraint(equalTo: aboutView.trailingAnchor),
            stackViewRight.widthAnchor.constraint(equalToConstant: 154),
            
            weaknessLabel.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 32),
            weaknessLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
//            stackViewWeakness.heightAnchor.constraint(equalToConstant: 125),
//            stackViewWeakness.topAnchor.constraint(equalTo: weaknessLabel.bottomAnchor, constant: -16),
//            stackViewWeakness.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            stackViewWeakness.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                        
            collectionView.topAnchor.constraint(equalTo: weaknessLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.heightAnchor.constraint(equalToConstant: 144)
        ])
    }
        
    func setupTypePill(pokemon: PokemonDetail) {
        pokemonImage.loadImage(urlString: pokemon.imageUrl)
        stackViewPokemonType.arrangedSubviews.forEach { $0.removeFromSuperview() }
        pokemon.types.forEach { typePokemon in
            let eachTypePill = setupPokemonTypePill(with: typePokemon.rawValue)
            stackViewPokemonType.addArrangedSubview(eachTypePill)
        }
    }
    
    func setupPokemonTypePill(with typePokemon: String) -> PillView {
        let typeView = PillView()
        typeView.configure(with: typePokemon)
        return typeView
    }
}
