//
//  TextField.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//
import SwiftUI
extension View {
    func styledTextField(borderColor: Color = primaryColor) -> some View {
        self
            .padding()
            .background(Color.white.opacity(0.2))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(borderColor, lineWidth: 3)
            )
            .cornerRadius(4)
    }
}
