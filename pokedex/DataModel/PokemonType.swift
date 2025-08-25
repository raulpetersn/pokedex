//
//  PokemonType.swift
//  pokedex
//
//  Created by Rauls on 02/06/25.
//

import UIKit

enum PokemonType: String, Codable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    
    func getTitle() -> String {
        return self.rawValue.capitalized
    }
    
    func getColor() -> UIColor {
        switch self {
        case .normal:
            return UIColor(hex: "#919AA2")
        case .fire:
            return UIColor(hex: "#FF9D55")
        case .water:
            return UIColor(hex: "#5090D6")
        case .electric:
            return UIColor(hex: "#F4D23C")
        case .grass:
            return UIColor(hex: "#63BC5A")
        case .ice:
            return UIColor(hex: "#73CEC0")
        case .fighting:
            return UIColor(hex: "#CE416B")
        case .poison:
            return UIColor(hex: "#B567CE")
        case .ground:
            return UIColor(hex: "#D97845")
        case .flying:
            return UIColor(hex: "#89AAE3")
        case .psychic:
            return UIColor(hex: "#FA7179")
        case .bug:
            return UIColor(hex: "#91C12F")
        case .rock:
            return UIColor(hex: "#C5B78C")
        case .ghost:
            return UIColor(hex: "#5269AD")
        case .dragon:
            return UIColor(hex: "#0B6DC3")
        case .dark:
            return UIColor(hex: "#5A5465")
        case .steel:
            return UIColor(hex: "#5A8EA2")
        case .fairy:
            return UIColor(hex: "#EC8FE6")
        }
    }
    
    func getBackgroundImageType() -> UIImage {
        
        let imageString: String
        
        switch self {
        case .bug:
            imageString = "bug"
        case .normal:
            imageString = "normal"
        case .fire:
            imageString = "fire"
        case .water:
            imageString = "water"
        case .electric:
            imageString = "electric"
        case .grass:
            imageString = "grass"
        case .ice:
            imageString = "ice"
        case .fighting:
            imageString = "figher"
        case .poison:
            imageString = "poison"
        case .ground:
            imageString = "ground"
        case .flying:
            imageString = "flying"
        case .psychic:
            imageString = "psychic"
        case .rock:
            imageString = "rock"
        case .ghost:
            imageString = "ghost"
        case .dragon:
            imageString = "dragon"
        case .dark:
            imageString = "dark"
        case .steel:
            imageString = "steel"
        case .fairy:
            imageString = "fairy"
        }
        
        return UIImage(named: imageString) ?? UIImage()
    }
}

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 4), (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
