//
//  Part11View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part11View: View {
    @State private var height: Double = 170.0
    @State private var weight: Double = 70.0

    var body: some View {
        VStack {
            Text("Height (cm): \(Int(height))")
                .padding()
            
            Slider(value: $height, in: 100...250, step: 1)
                .padding()

            Text("Weight (kg): \(Int(weight))")
                .padding()

            Slider(value: $weight, in: 30...200, step: 1)
                .padding()

            NavigationLink(destination: Part12View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 11")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part11View_Previews: PreviewProvider {
    static var previews: some View {
        Part11View()
    }
}