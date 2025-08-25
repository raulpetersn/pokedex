//
//  PillView.swift
//  pokedex
//
//  Created by Rauls on 20/08/25.
//

import UIKit


enum PillViewSize: CGFloat {
    case extraSmall = 92
    case small = 108
    case medium = 116
    case big = 124
    
    static func from(typeCount: Int) -> PillViewSize {
        switch typeCount {
        case 5,6: return .small
        case 7: return .medium
        case 8: return .big
        default: return .extraSmall
        }
    }
}


class PillView: UIView {
   
    private var widthConstraint: NSLayoutConstraint!
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(hex: "#49D0B0")
        return view
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pokemonIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "teste")
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
    
    func configure(with pokemonType: String) {
            pokemonTypeLbl.text = pokemonType
            let size = PillViewSize.from(typeCount: pokemonType.count)
            widthConstraint.constant = size.rawValue
    }
    
    func setupView() {
        addSubview(contentView)
        addSubview(circleView)
        circleView.addSubview(pokemonIconImage)
        addSubview(pokemonTypeLbl)
        
        setupConstrains()
   
    }
    
    func setupConstrains() {
        widthConstraint = contentView.widthAnchor.constraint(equalToConstant: PillViewSize.small.rawValue)
        NSLayoutConstraint.activate([
            widthConstraint,
            contentView.widthAnchor.constraint(equalToConstant: PillViewSize.small.rawValue),
            contentView.heightAnchor.constraint(equalToConstant: 36),
            
            circleView.widthAnchor.constraint(equalToConstant: 32),
            circleView.heightAnchor.constraint(equalToConstant: 32),
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            pokemonIconImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            pokemonIconImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            
            pokemonTypeLbl.leadingAnchor.constraint(equalTo: pokemonIconImage.trailingAnchor, constant: 8),
            pokemonTypeLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            pokemonTypeLbl.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        
        ])
    }
    
}

