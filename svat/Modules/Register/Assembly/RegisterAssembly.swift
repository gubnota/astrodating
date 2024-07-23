import SwiftUI

class RegisterAssembly {
    static func assemble() -> some View {
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        let interactor = RegisterInteractor(presenter: presenter)
        presenter.interactor = interactor
        presenter.router = router
        return RegisterView(presenter: presenter)
    }
}
