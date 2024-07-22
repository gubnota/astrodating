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
    @ObservedObject var viewModel: QuizViewModel
    @EnvironmentObject var app: AppViewModel
    var body: some View {
        VStack {
            Spacer()
            Text("Регистрация")
                .font(.largeTitle)
                .padding()

            TextField("Имя пользователя", text: $username)
                .styledTextField()

            SecureField("Пароль", text: $password)
                .styledTextField()
            Button(action: {
                app.currentRoute = "questionnaire"
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
            Spacer()
        }
        .padding()
//        .navigate(to: QuestionnaireView(viewModel: QuizViewModel()), when: $isQuestionnaireStarted)
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(viewModel: QuizViewModel.init(properties: ["currentRoute":"register"])
        )
        .environmentObject(AppViewModel())
        //QuestionnaireView(viewModel: QuizViewModel())//LoginView()//ContentView
    }
//        NavigationView {
//
//        RegisterView(viewModel: QuizViewModel())
//        }
//        .navigationViewStyle(StackNavigationViewStyle())// make iPad version to fill up whole area
//        .navigationBarHidden(true) // Hide the navigation bar
//        .navigationBarTitle("", displayMode: .inline) // Set title to empty string
//    }
}
