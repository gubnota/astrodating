//
//  Font.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//

import SwiftUI

extension Font {
    static let customRegular = Font.custom("Arial-Regular", size: 17)
    static let customBold = Font.custom("Arial-Bold", size: 17)
    
    static func system(_ style: Font.TextStyle, design: Font.Design? = nil) -> Font {
        switch style {
        case .largeTitle, .title, .title2, .title3, .headline, .subheadline, .body, .callout, .footnote, .caption, .caption2:
            return customRegular
        default:
            return customBold
        }
    }
    
    static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        switch weight {
        case .bold:
            return customBold
        default:
            return customRegular
        }
    }
}
