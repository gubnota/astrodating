//
//  Part9View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part9View: View {
    @State private var pursuitMethod = ""

    var body: some View {
        VStack {
            Text("What method do you use to pursue your partner?")
                .font(.title2)
                .padding()

            Picker("Pursuit Method", selection: $pursuitMethod) {
                ForEach(pursuitMethods, id: \.self) { method in
                    Text(method)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part10View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 9")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let pursuitMethods = ["Actively Looking", "Passively Waiting", "Consultation", "Meeting"]

struct Part9View_Previews: PreviewProvider {
    static var previews: some View {
        Part9View()
    }
}