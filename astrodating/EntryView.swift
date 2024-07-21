//
//  EntryyView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI

struct EntryView: View {
    @ObservedObject var viewModel: QuizViewModel

    let sampleUsers = [
        Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
        Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
        Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
        Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
        Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки"),
        Person(name: "Петр Авен", imageName: "john_smith", astrologicalSign: "Близнецы", chineseZodiac: "Крысы", region: "Санкт-Петербург", loveLanguage: "Служение"),
        Person(name: "Юлия Крыжановская", imageName: "morgan johnson", astrologicalSign: "Leo", chineseZodiac: "Бык", region: "Москва", loveLanguage: "Подарки")
    ]

    var body: some View {
        NavigationView {
            if viewModel.isLoggedIn && viewModel.currentStep > 16 {
                UserListView(users: sampleUsers)
            } else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.deserializeFromJson()
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(viewModel: QuizViewModel())
    }
}
