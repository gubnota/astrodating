import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
    @State private var isRegistering = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Вход")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                TextField("Имя пользователя", text: $username)
                    .styledTextField()
                
                SecureField("Пароль", text: $password)
                    .styledTextField()

                Button(action: {
                    if username == "123" && password == "admin" {
                        isLoggedIn = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Вход")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#FD80C3"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Неверные логин/пароль!"), message: Text("Имя пользователя или пароль неверны"), dismissButton: .default(Text("OK")))
                }

                NavigationLink(destination: RegisterView(), isActive: $isRegistering) {
                    Button("Регистрация") {
                        isRegistering = true
                    }
                }
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color(hex: "#05B5CD"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarHidden(true)
        }
        .navigate(to: QuestionnaireView(viewModel: QuizViewModel()), when: $isLoggedIn)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
