//
//  Part10View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part10View: View {
    @State private var selfIntro = ""

    var body: some View {
        VStack {
            Text("Introduce Yourself")
                .padding()
            
            TextEditor(text: $selfIntro)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding()

            NavigationLink(destination: Part11View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 10")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part10View_Previews: PreviewProvider {
    static var previews: some View {
        Part10View()
    }
}
