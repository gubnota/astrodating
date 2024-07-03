//
//  Part12View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part12View: View {
    @State private var endOfPreviousRelationship = Date()

    var body: some View {
        VStack {
            DatePicker("End of Previous Relationship", selection: $endOfPreviousRelationship, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            NavigationLink(destination: Part13View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 12")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part12View_Previews: PreviewProvider {
    static var previews: some View {
        Part12View()
    }
}