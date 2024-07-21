//
//  UserListView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct UserListView: View {
    var users: [Person]
    let gradient = LinearGradient(colors: [Color(hex: "#FD80C3").opacity(0.2), Color(hex: "#05B5CD").opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)

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
            .navigationTitle("Кандидаты")
            
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
                .overlay(Circle().stroke(Color(hex: "#FD80C3"), lineWidth: 2))
                .shadow(radius: 5)
            Spacer()
            Text(person.name)
                .font(.headline)
                .foregroundColor(.black)
            Text(person.region)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .padding()
        .frame(height: 260)
        .background(gradient)
        .cornerRadius(10)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUsers = [
            Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
            Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
            Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
            Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
            Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
            Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
            Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки")
        ]
        UserListView(users: sampleUsers)
    }
}
