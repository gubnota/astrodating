import SwiftUI

struct LoginView: View {
    @ObservedObject var loginPresenter: LoginPresenter

    init(loginPresenter: LoginPresenter) {
        self.loginPresenter = loginPresenter
    }

    
    var body: some View {
          VStack {
              TextField("Username", text: $loginPresenter.username)
                  .styledTextField()

              SecureField("Password", text: $loginPresenter.password)
                  .styledTextField()

              Button("Login") {
                  loginPresenter.login()
              }
              .padding()
          }
          .padding()
      }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let mockEntryPresenter = EntryPresenter(interactor: EntryInteractor(), router: EntryRouter())
        LoginAssembly.assemble(entryPresenter: mockEntryPresenter)
    }
}
