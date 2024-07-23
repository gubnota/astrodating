import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    var router: LoginRouter
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("Вход"))
                .font(.largeTitle)
                .padding()
            
            TextField(LocalizedStringKey("Имя пользователя"), text: $presenter.username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            SecureField(LocalizedStringKey("Пароль"), text: $presenter.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            Button(action: {
                presenter.login()
            }) {
                Text(LocalizedStringKey("Войти"))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            .padding()
            
            Button(action: {
                router.navigateToRegister()
            }) {
                Text(LocalizedStringKey("Регистрация"))
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAssembly.assemble()
    }
}
