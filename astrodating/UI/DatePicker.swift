//
//  DatePicker.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//

import SwiftUI
extension View{
func styledDatePicker(borderColor: Color = Color(hex: "#FD80C3")) -> some View {
    self
        .datePickerStyle(WheelDatePickerStyle())//GraphicalDatePickerStyle())
        .environment(\.locale, Locale(identifier: "ru"))
        .padding()
        .background(Color.white.opacity(1))
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(borderColor, lineWidth: 4)
        )
        .cornerRadius(4)
}
}
