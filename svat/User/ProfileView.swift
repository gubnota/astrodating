//
//  ProfileView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: QuizViewModel
    @EnvironmentObject var app: AppViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text("Профиль")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Image("user4")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(primaryColor, lineWidth: 6))

            let profileData: [(String, String)] = [
                ("Имя:", viewModel.name),
                ("Фамилия:", viewModel.surname),
                ("Пол:", viewModel.gender == 1 ? "Мужской" : "Женский"),
                ("Регион:", viewModel.regions.first(where: { $0.id == viewModel.region })?.name ?? ""),
                ("Знак Зодиака:", viewModel.astroSigns.first(where: { $0.id == viewModel.astroSign })?.name ?? ""),
                ("Китайский Зодиак:", viewModel.chineseZodiacs.first(where: { $0.id == viewModel.chineseZodiac })?.name ?? ""),
                ("Любовный Язык:", viewModel.loveLanguages.first(where: { $0.id == viewModel.loveLanguage1 })?.name ?? ""),
                ("Второй Любовный Язык:", viewModel.loveLanguages.first(where: { $0.id == viewModel.loveLanguage2 })?.name ?? ""),
                ("Семейное Положение:", viewModel.maritalStatus == 1 ? "Холост" : "Женат"),
                ("Метод Поиска Партнера:", viewModel.partnerMethods.first(where: { $0.id == viewModel.partnerMethod })?.name ?? ""),
                ("Вредные Привычки:", viewModel.badHabitsList.first(where: { $0.id == viewModel.badHabits })?.name ?? ""),
                ("Дети:", viewModel.hasChildrenList.first(where: { $0.id == viewModel.hasChildren })?.name ?? ""),
                ("Экс-Китайский Зодиак:", viewModel.chineseZodiacs.first(where: { $0.id == viewModel.exChineseZodiac })?.name ?? ""),
                ("Экс-Знак Зодиака:", viewModel.astroSigns.first(where: { $0.id == viewModel.exAstroSign })?.name ?? "")
            ]

            VStack(alignment: .leading, spacing: 10) {
                ForEach(profileData, id: \.0) { item in
                    HStack {
                        Text(item.0).bold().lineLimit(3)
                        Spacer()
                        Text(item.1).lineLimit(3)
                    }
                }
            }
            .padding()

            Spacer()
            Button(action: {
                app.goToHome()// currentRoute = ''
            }) {
                Text("Выход")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.padding(.horizontal)
        Rectangle().opacity(0).frame(height: 60)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: QuizViewModel()).environmentObject(AppViewModel())
    }
}
