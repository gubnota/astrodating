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
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
            
            VStack {
                if #available(iOS 16.0, *) {
                    Text(leftText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Adjust padding to respect safe area
                } else {
                    Text(leftText)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Adjust padding to respect safe area
                }
                
                Spacer()
                
                if #available(iOS 16.0, *) {
                    Text(rightText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60) // Adjust the padding as necessary to position it above the bottom edge
                } else {
                    Text(rightText)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60) // Adjust the padding as necessary to position it above the bottom edge
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
