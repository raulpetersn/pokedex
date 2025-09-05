//
//  PillView.swift
//  pokedex
//
//  Created by Rauls on 20/08/25.
//

import UIKit

enum PillViewSize: CGFloat {
    case small = 99
    case medium = 112
    case big = 116
    case none = 32
    
    static func from(totalOfCharacters: Int) -> PillViewSize {
        switch totalOfCharacters {
        case 0...4: return .small
        case 5: return .medium
        case 6...8: return .big
        default: return .none
        }        
    }
}

class PillView: UIView {
    
    private var widthConstraint: NSLayoutConstraint!
    private var iconLeadingConstraint: NSLayoutConstraint!
    private var labelLeadingConstraint: NSLayoutConstraint!
    private var labelTrailingConstraint: NSLayoutConstraint!
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(hex: "#49D0B0")
        return view
    }()
    
    lazy var pokemonIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "grass_color")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
        
    lazy var pokemonTypeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "grama"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with pokemonType: String, isLarge: Bool = false) {
        guard let type = PokemonType(rawValue: pokemonType.lowercased()) else { return }
        let size = PillViewSize.from(totalOfCharacters: pokemonType.count)
        
        pokemonTypeLbl.text = pokemonType.capitalized
        widthConstraint.constant = isLarge ? 156 : size.rawValue
        contentView.backgroundColor = type.getColor()
        pokemonIconImage.image = type.getBackgroundImageType(withBackground: true)
        
        updateConstraintsForSize(isLarge: isLarge)
    }
    
    private func setupView() {
        addSubview(contentView)
        addSubview(pokemonIconImage)
        addSubview(pokemonTypeLbl)
        
        setupConstrains()   
    }
    
    func setupConstrains() {
        widthConstraint = contentView.widthAnchor.constraint(equalToConstant: PillViewSize.big.rawValue)
        iconLeadingConstraint = pokemonIconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        labelLeadingConstraint = pokemonTypeLbl.leadingAnchor.constraint(equalTo: pokemonIconImage.trailingAnchor, constant: 8)
        labelTrailingConstraint = pokemonTypeLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            contentView.heightAnchor.constraint(equalToConstant: 36),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
            pokemonIconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconLeadingConstraint,
            
            labelLeadingConstraint,
            labelTrailingConstraint,
            pokemonTypeLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func updateConstraintsForSize(isLarge: Bool) {
           let leadingConstant: CGFloat = isLarge ? 32 : 8
           let trailingConstant: CGFloat = isLarge ? -32 : -8
            
           iconLeadingConstraint.constant = leadingConstant
           labelTrailingConstraint.constant = trailingConstant

           UIView.animate(withDuration: 0.3) {
               self.layoutIfNeeded()
           }
       }
    
}

