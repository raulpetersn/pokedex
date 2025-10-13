//
//  UiStackView+Extensions.swift
//  pokedex
//
//  Created by Rauls on 11/09/25.
//

import UIKit

extension UIStackView {
  
    func setupStackViewPills(with pokemonTypes: [PokemonType], style: PillStyle = .normal(isLarge: false)) {
           arrangedSubviews.forEach { $0.removeFromSuperview() }
           pokemonTypes.forEach { type in
               let pill = PillView()
               pill.configure(with: type.rawValue, style: style)
               addArrangedSubview(pill)
           }
       }
}
