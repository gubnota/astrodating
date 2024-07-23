import SwiftUI

class LoginAssembly {
    static func assemble() -> some View {
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor(presenter: presenter)
        presenter.interactor = interactor
        presenter.router = router
        return LoginView(presenter: presenter, router: router)
    }
}
