//
//  Part7View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part7View: View {
    @State private var tel = ""
    @State private var vkLink = ""
    @State private var okLink = ""
    @State private var fbLink = ""
    @State private var igLink = ""
    @State private var telegramLink = ""
    @State private var skype = ""

    var body: some View {
        VStack {
            TextField("Telephone", text: $tel)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("VK Link", text: $vkLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("OK Link", text: $okLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Facebook Link", text: $fbLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Instagram Link", text: $igLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Telegram Link", text: $telegramLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Skype", text: $skype)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            NavigationLink(destination: Part8View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 7")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct Part7View_Previews: PreviewProvider {
    static var previews: some View {
        Part7View()
    }
}