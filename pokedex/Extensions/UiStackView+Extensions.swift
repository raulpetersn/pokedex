//
//  UiStackView+Extensions.swift
//  pokedex
//
//  Created by Rauls on 11/09/25.
//

import UIKit

extension UIStackView {
    
    func setupStackViewPills(with pokemonTypes: [PokemonType], isPokemonType: Bool = false) {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        pokemonTypes.forEach { typePokemon in
            let eachTypePill = setupPokemonTypePill(with: typePokemon.rawValue, isPokemonType: isPokemonType )
            addArrangedSubview(eachTypePill)
        }
    }
    
    func setupPokemonTypePill(with typePokemon: String, isPokemonType: Bool) -> PillView {
        let typeView = PillView()
        typeView.configure(with: typePokemon, isFullSizePokemonTypePill: isPokemonType)
        return typeView
    }
}
