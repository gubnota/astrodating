//
//  NavigationLinkModifier.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct NavigationLinkModifier<Destination: View>: ViewModifier {
    let destination: Destination
    @Binding var isActive: Bool

    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destination, isActive: $isActive) {
                    EmptyView()
                }
                .hidden()
            )
    }
}

extension View {
    func navigate<Destination: View>(to destination: Destination, when binding: Binding<Bool>) -> some View {
        self.modifier(NavigationLinkModifier(destination: destination, isActive: binding))
    }
}