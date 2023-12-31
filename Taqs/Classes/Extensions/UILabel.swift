//
//  UILabel.swift
//  Taqs
//
//  Created by Salma on 17/06/2023.
//

import UIKit

extension UILabel
{
    // MARK: Style
    
    enum Style{
        case header
        case title
        case subtitle
        case fourth
        
        var labelTextColor: UIColor {
                return .white
            }
        
        var labelFont: UIFont {
            switch self {
            case .header:
                return LabelFont.headerLabel
            case .title:
                return LabelFont.title
            case .subtitle:
                return LabelFont.subtitle
            case .fourth:
                return LabelFont.fourth
            }
        }
    }
}

// MARK: Style Attributes
extension UILabel {
    func applyStyle(_ style: Style) {
        textColor = style.labelTextColor
        font = style.labelFont
    }
}

// MARK: - Fonts
private enum LabelFont {
    static let headerLabel = UIFont.systemFont(ofSize: 38, weight: .bold)
    static let title = UIFont.systemFont(ofSize: 28, weight: .semibold)
    static let subtitle = UIFont.systemFont(ofSize: 18, weight: .regular)
    static let fourth = UIFont.systemFont(ofSize: 22, weight: .medium)
}
