//
//  Part6View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part6View: View {
    @State private var maritalStatus = ""

    var body: some View {
        VStack {
            Text("Select your marital status")
                .font(.title2)
                .padding()

            Picker("Marital Status", selection: $maritalStatus) {
                ForEach(maritalStatuses, id: \.self) { status in
                    Text(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part7View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 6")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let maritalStatuses = ["Single", "Married"]

struct Part6View_Previews: PreviewProvider {
    static var previews: some View {
        Part6View()
    }
}