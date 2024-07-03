//
//  UserListView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct UserListView: View {
    var users: [Person]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(users) { user in
                        NavigationLink(destination: PersonDetailView(person: user)) {
                            UserCardView(person: user)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Potential Matches")
        }
    }
}

struct UserCardView: View {
    var person: Person

    var body: some View {
        VStack {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
            Text(person.name)
                .font(.headline)
            Text(person.region)
                .font(.subheadline)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUsers = [
            Person(name: "John Doe", imageName: "john_doe", astrologicalSign: "Gemini", chineseZodiac: "Rat", region: "Saint Petersburg", loveLanguage: "Acts of Service"),
            Person(name: "Jane Smith", imageName: "jane_smith", astrologicalSign: "Leo", chineseZodiac: "Ox", region: "Moscow", loveLanguage: "Physical Touch")
        ]
        UserListView(users: sampleUsers)
    }
}