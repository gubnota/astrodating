//
//  Part5View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part5View: View {
    @State private var selectedLoveLanguage = ""

    var body: some View {
        VStack {
            Text("Select your second love language")
                .font(.title2)
                .padding()

            Picker("Love Language", selection: $selectedLoveLanguage) {
                ForEach(loveLanguages, id: \.self) { language in
                    Text(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part6View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 5")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}