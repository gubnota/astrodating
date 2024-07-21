//
//  ProfileView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
            VStack(spacing: 20) {
                Text("Профиль")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

//                if let profileImage = "john_smith" {//viewModel.profileImage
                    Image("john_smith")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(hex: "#FD80C3"), lineWidth: 6))
//                        .shadow(radius: 10)
//                } else {
//                    Image(systemName: "person.crop.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150)
//                        .foregroundColor(.gray)
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .shadow(radius: 10)
//                }

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Имя:").bold()
                        Spacer()
                        Text(viewModel.name)
                    }

                    HStack {
                        Text("Фамилия:").bold()
                        Spacer()
                        Text(viewModel.surname)
                    }

                    HStack {
                        Text("Пол:").bold()
                        Spacer()
                        Text(viewModel.gender == 1 ? "Мужской" : "Женский")
                    }

                    HStack {
                        Text("Регион:").bold()
                        Spacer()
                        if let region = viewModel.regions.first(where: { $0.id == viewModel.region }) {
                            Text(region.name)
                        }
                    }

                    HStack {
                        Text("Знак Зодиака:").bold()
                        Spacer()
                        if let astroSign = viewModel.astroSigns.first(where: { $0.id == viewModel.astroSign }) {
                            Text(astroSign.name)
                        }
                    }

                    HStack {
                        Text("Китайский Зодиак:").bold()
                        Spacer()
                        if let chineseZodiac = viewModel.chineseZodiacs.first(where: { $0.id == viewModel.chineseZodiac }) {
                            Text(chineseZodiac.name)
                        }
                    }

                    HStack {
                        Text("Любовный Язык:").bold()
                        Spacer()
                        if let loveLanguage = viewModel.loveLanguages.first(where: { $0.id == viewModel.loveLanguage1 }) {
                            Text(loveLanguage.name)
                        }
                    }

                    HStack {
                        Text("Второй Любовный Язык:").bold()
                        Spacer()
                        if let loveLanguage = viewModel.loveLanguages.first(where: { $0.id == viewModel.loveLanguage2 }) {
                            Text(loveLanguage.name)
                        }
                    }

                    HStack {
                        Text("Семейное Положение:").bold()
                        Spacer()
                        Text(viewModel.maritalStatus == 1 ? "Холост" : "Женат")
                    }

                    HStack {
                        Text("Метод Поиска Партнера:").bold()
                        Spacer()
                        if let partnerMethod = viewModel.partnerMethods.first(where: { $0.id == viewModel.partnerMethod }) {
                            Text(partnerMethod.name)
                        }
                    }

                    HStack {
                        Text("Вредные Привычки:").bold()
                        Spacer()
                        if let badHabit = viewModel.badHabitsList.first(where: { $0.id == viewModel.badHabits }) {
                            Text(badHabit.name)
                        }
                    }

                    HStack {
                        Text("Дети:").bold()
                        Spacer()
                        if let childrenStatus = viewModel.hasChildrenList.first(where: { $0.id == viewModel.hasChildren }) {
                            Text(childrenStatus.name)
                        }
                    }

                    HStack {
                        Text("Экс-Китайский Зодиак:").bold()
                        Spacer()
                        if let exChineseZodiac = viewModel.chineseZodiacs.first(where: { $0.id == viewModel.exChineseZodiac }) {
                            Text(exChineseZodiac.name)
                        }
                    }

                    HStack {
                        Text("Экс-Знак Зодиака:").bold()
                        Spacer()
                        if let exAstroSign = viewModel.astroSigns.first(where: { $0.id == viewModel.exAstroSign }) {
                            Text(exAstroSign.name)
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .padding(.horizontal)
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: QuizViewModel())
    }
}
