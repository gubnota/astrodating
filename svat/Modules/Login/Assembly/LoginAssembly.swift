import SwiftUI

class LoginAssembly {
    static func assemble(entryPresenter: EntryPresenter) -> some View {
        let interactor = LoginInteractor(entryPresenter: entryPresenter)
        let presenter = LoginPresenter(interactor: interactor)
        return LoginView(loginPresenter: presenter)
    }
}
