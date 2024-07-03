//
//  Part2View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part2View: View {
    @Binding var dateOfBirth: Date

    var body: some View {
        VStack {
            DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            NavigationLink(destination: Part3View(dateOfBirth: $dateOfBirth)) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 2")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part2View_Previews: PreviewProvider {
    @State static var dateOfBirth = Date()
    static var previews: some View {
        Part2View(dateOfBirth: $dateOfBirth)
    }
}
