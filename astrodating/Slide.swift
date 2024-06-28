//
//  Slide.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

struct Slide: View {
    var imageName: String
    var leftText: String
    var rightText: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
            HStack {
                Text(leftText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text(rightText)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
        }
    }
}
