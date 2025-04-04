import SwiftUI

struct LoginView: View {
    @State private var username: String = "123"
    @State private var password: String = "admin"
    @State private var showAlert = false
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
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
                    viewModel.currentRoute = "list"
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

            Rectangle().frame(height: 10).opacity(0)

            Button("Регистрация") {
                viewModel.currentRoute = "register"
            }
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color(hex: "#05B5CD"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .dismissKeyboardOnTap()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: QuizViewModel())
    }
}
