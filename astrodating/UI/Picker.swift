//
//  Picker.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//
import SwiftUI
extension View{
    func styledPicker(borderColor: Color = Color(hex: "#FD80C3")) -> some View {
        self
            .pickerStyle(MenuPickerStyle())
            .padding()
            .frame(maxWidth: .infinity,maxHeight: 50.0)
            .background(Color.white.opacity(1))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(borderColor, lineWidth: 3)
            )
            .cornerRadius(4)
            .accentColor(.black)
            .font(.system(size: 16, weight: .bold))
    }
}
