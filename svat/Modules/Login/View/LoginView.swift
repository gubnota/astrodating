import SwiftUI

struct LoginView: View {
    @ObservedObject var loginPresenter: LoginPresenter

    init(loginPresenter: LoginPresenter) {
        self.loginPresenter = loginPresenter
    }

    var body: some View {
        VStack {
            TextField(LocalizedStringKey("Username"), text: $loginPresenter.username)
                .styledTextField()

            SecureField(LocalizedStringKey("Password"), text: $loginPresenter.password)
                .styledTextField()

            Button(LocalizedStringKey("Login")) {
                loginPresenter.login()
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $loginPresenter.showAlert) {
            Alert(title: Text(LocalizedStringKey("Login Failed")),
                  message: Text(loginPresenter.alertMessage),
                  dismissButton: .default(Text(LocalizedStringKey("OK"))))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a mock EntryPresenter for preview
        let mockEntryPresenter = EntryPresenter(interactor: EntryInteractor(), router: EntryRouter())
        return LoginAssembly.assemble(entryPresenter: mockEntryPresenter)
    }
}
