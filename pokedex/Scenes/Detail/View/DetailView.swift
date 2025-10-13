//
//  DetailView.swift
//  pokedex
//
//  Created by Rauls on 10/06/25.
//

import UIKit

class DetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.layer.cornerRadius = 24
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .white
        scroll.clipsToBounds = false
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
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var stackViewPokemonType: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "koffing")
        image.layer.masksToBounds = true
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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 168, height: 36)
        layout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailWeaknessCollectionViewCell.self, forCellWithReuseIdentifier: DetailWeaknessCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    lazy var evolutionsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Evoluções"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var tableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(DetailEvolutionTableViewCell.self, forCellReuseIdentifier: DetailEvolutionTableViewCell.identifier)
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = UITableView.automaticDimension
        table.layer.cornerRadius = 8
        table.layer.borderColor = UIColor(hex: "7F8CAA").cgColor
        table.clipsToBounds = true
        table.layer.borderWidth = 1
        table.isScrollEnabled = false
        table.allowsSelection = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    var collectionViewHeight: NSLayoutConstraint!
    var tableViewHeightConstraint: NSLayoutConstraint!
    
    private func setupView() {
        attributeWeight.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(contentView)
     
        contentView.addSubview(pokemonTitleLabel)
        contentView.addSubview(pokemonNumberLabel)
        contentView.addSubview(pokemonImage)
        contentView.addSubview(stackViewPokemonType)
        contentView.addSubview(aboutView)
        aboutView.addSubview(stackViewLeft)
        aboutView.addSubview(stackViewRight)
        contentView.addSubview(weaknessLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(evolutionsLbl)
        contentView.addSubview(tableView)

        setupConstrains()
    }
    
    private func setupConstrains() {
        
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 300)
        collectionViewHeight = collectionView.heightAnchor.constraint(equalToConstant: 104)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2),
        
            pokemonTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pokemonTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            pokemonNumberLabel.topAnchor.constraint(equalTo: pokemonTitleLabel.bottomAnchor, constant: 8),
            pokemonNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonTitleLabel.topAnchor, constant: 20),
            pokemonImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 184),
            pokemonImage.heightAnchor.constraint(equalToConstant: 184),
                        
            stackViewPokemonType.heightAnchor.constraint(equalToConstant: 40),
            stackViewPokemonType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -136),
            stackViewPokemonType.topAnchor.constraint(equalTo: pokemonNumberLabel.bottomAnchor, constant: 16),
            stackViewPokemonType.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

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
            weaknessLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                        
            collectionView.topAnchor.constraint(equalTo: weaknessLabel.bottomAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionViewHeight,
            
            evolutionsLbl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            evolutionsLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: evolutionsLbl.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tableViewHeightConstraint,
        ])
    }
        
    func setupEvolutionsPills(pokemon: PokemonInfo) {
        pokemonTitleLabel.text = pokemon.name.capitalized
        pokemonNumberLabel.text = formatPokemonId(pokemon.id)
        pokemonImage.loadImage(urlString: pokemon.imageUrl)
        stackViewPokemonType.setupStackViewPills(with: pokemon.types)
        if let poke = PokemonType(rawValue: (pokemon.types.first ?? .normal).rawValue) {
            self.backgroundColor = poke.getColor()
        }
        
    }
    
    private func formatPokemonId(_ id: Int) -> String {
        return String(format: "Nº %03d",id) 
    }

    
    func updateTableAndCollectionHeight() {
        tableView.layoutIfNeeded()
        collectionView.layoutIfNeeded()
        
        let tableContentHeight = tableView.contentSize.height
        let collectionContentHeight = collectionView.contentSize.height
        tableViewHeightConstraint.constant = tableContentHeight
        collectionViewHeight.constant = collectionContentHeight
    }
    
}
