//
//  Part1View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part1View: View {
    @Binding var name: String
    @Binding var surname: String
    @Binding var gender: String
    @Binding var region: String

    var body: some View {
        VStack {
            Text("Part 1")
                .font(.largeTitle)
                .padding()

            TextField("Name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Surname", text: $surname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            Picker("Gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TextField("Region", text: $region)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
        }
    }
}