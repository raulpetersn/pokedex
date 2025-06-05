//
//  RadiusButton.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//

import UIKit

class RadiusButton: UIView {
    
    lazy var buttonType: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Poison"
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(buttonType)
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            buttonType.heightAnchor.constraint(equalToConstant: 24),
            buttonType.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonType.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func radiusBackgroundColor(selectedColor: UIColor) {
        buttonType.backgroundColor = selectedColor
    }
    
}
