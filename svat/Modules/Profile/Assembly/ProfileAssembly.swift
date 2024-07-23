import SwiftUI

class ProfileAssembly {
    static func assemble() -> some View {
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        let interactor = ProfileInteractor(presenter: presenter)
        presenter.interactor = interactor
        presenter.router = router
        return ProfileView(presenter: presenter)
    }
}
