//
//  Part14View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part14View: View {
    @State private var badHabits = ""

    var body: some View {
        VStack {
            Text("Do you have any bad habits?")
                .font(.title2)
                .padding()

            Picker("Bad Habits", selection: $badHabits) {
                ForEach(badHabitOptions, id: \.self) { habit in
                    Text(habit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part15View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 14")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let badHabitOptions = ["I smoke", "I don't", "Don't want to tell"]

struct Part14View_Previews: PreviewProvider {
    static var previews: some View {
        Part14View()
    }
}