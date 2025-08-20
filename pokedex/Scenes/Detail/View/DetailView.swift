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
        view.backgroundColor = .blue
        return view
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
    
    lazy var stackViewPokemonType: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
                            
        return stack
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "koffing")
        return image
    }()
    
    lazy var headerSegmentControl = {
        let segement = UISegmentedControl(items: ["About", "Base stats", "Evolution", "Moves"])
        segement.translatesAutoresizingMaskIntoConstraints = false
        segement.selectedSegmentIndex = 0
        segement.addTarget(self, action: #selector(didChangeTab), for: .valueChanged)
        
        return segement
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(contentView)
        contentView.addSubview(bottomView)
        bottomView.addSubview(pokemonTitleLabel)
        bottomView.addSubview(pokemonNumberLabel)
        bottomView.addSubview(pokemonImage)
        bottomView.addSubview(headerSegmentControl)
        bottomView.addSubview(aboutView)
        aboutView.addSubview(stackViewLeft)
        aboutView.addSubview(stackViewRight)
        setupConstrains()
        attributeWeight.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            bottomView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pokemonTitleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            pokemonTitleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
            
            pokemonNumberLabel.topAnchor.constraint(equalTo: pokemonTitleLabel.bottomAnchor, constant: 8),
            pokemonNumberLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
            headerSegmentControl.topAnchor.constraint(equalTo: pokemonNumberLabel.bottomAnchor, constant: 16),
            headerSegmentControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: -154),
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 154),
            pokemonImage.heightAnchor.constraint(equalToConstant: 154),
            
            aboutView.topAnchor.constraint(equalTo: headerSegmentControl.bottomAnchor, constant: 16),
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

        ])
        
    }
    
    @objc
    func didChangeTab(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("click no indice \(sender.selectedSegmentIndex)")
        case 1:
            print("click no indice \(sender.selectedSegmentIndex)")
        case 2:
            print("click no indice \(sender.selectedSegmentIndex)")
        case 3 :
            print("click no indice \(sender.selectedSegmentIndex)")
            
        default: break
            
        }
    }
    
    func presentSelectTab(selected index: Int) {
        switch index {
        case 0 : break
            
        default:
            break
        }
    }
    
}
