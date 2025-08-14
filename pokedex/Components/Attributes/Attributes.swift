//
//  Attributes.swift
//  pokedex
//
//  Created by Rauls on 04/08/25.
//

import UIKit

enum CategoryIcon: String {
    case weight = "weight-icon"
    case height = "height-icon"
    case skill = "pokeball-icon"
    case category = "category-icon"
}

class Atributes: UIView {
    
    lazy var contentView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var iconView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Peso"
        label.font = .systemFont(ofSize: 12	)
        return label
    }()
    
    lazy var radiusView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var attributeLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "32"
        return label
    }()
    
    init(titleAttibute: String, descriptionAtrribute: String, icon: CategoryIcon) {
        super.init(frame: .zero)
        setupView()
        titleLabel.text = titleAttibute
        attributeLabel.text = descriptionAtrribute
        iconView.image = UIImage(named: icon.rawValue)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(contentView)
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(radiusView)
        contentView.addSubview(attributeLabel)
        setupConstrains()
        contentView.backgroundColor = .white
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 154),
            contentView.heightAnchor.constraint(equalToConstant: 63),
            
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 16),
            iconView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            
            radiusView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            radiusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            radiusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            radiusView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        
            attributeLabel.centerXAnchor.constraint(equalTo: radiusView.centerXAnchor),
            attributeLabel.centerYAnchor.constraint(equalTo: radiusView.centerYAnchor),
            
        ])
    }
    
}
