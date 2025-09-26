//
//  DetailWeaknessCollectionViewCell.swift
//  pokedex
//
//  Created by Rauls on 01/09/25.
//

import UIKit

class DetailWeaknessCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailWeaknessCollectionViewCell"

    let pillView = PillView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pillView)
        pillView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pillView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pillView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pillView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            pillView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(typeName: String, isLarge: Bool) {
        pillView.configure(with: typeName, isLarge: isLarge)
    }
}
