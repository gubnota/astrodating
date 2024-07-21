//
//  dismissKeyboard.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
 
    func dismissKeyboardOnTap() -> some View {
        self.onTapGesture {
            self.hideKeyboard()
        }
    }
}
