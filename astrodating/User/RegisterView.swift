//
//  RegisterView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isQuestionnaireStarted = false

    var body: some View {
        VStack {
            Text("Регистрация")
                .font(.largeTitle)
                .padding()

            TextField("Имя пользователя", text: $username)
                .styledTextField()

            SecureField("Пароль", text: $password)
                .styledTextField()
            Spacer()
            Button(action: {
                // Implement registration logic here
                isQuestionnaireStarted = true
            }) {
                Text("След")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigate(to: QuestionnaireView(viewModel: QuizViewModel()), when: $isQuestionnaireStarted)
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()//viewModel: QuizViewModel()
    }
}
