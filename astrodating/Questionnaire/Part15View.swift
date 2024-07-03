//
//  Part15View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part15View: View {
    @State private var hasChildren = ""

    var body: some View {
        VStack {
            Text("Do you have children?")
                .font(.title2)
                .padding()

            Picker("Children", selection: $hasChildren) {
                ForEach(childrenOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part16View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 15")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let childrenOptions = ["I do", "I don't", "Don't want to tell"]

struct Part15View_Previews: PreviewProvider {
    static var previews: some View {
        Part15View()
    }
}
