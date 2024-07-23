import SwiftUI
protocol ProfileInteractorProtocol {
    func performLogout()
}
protocol ProfileRouterProtocol {
    func navigateToNextScreen()
}
protocol ProfilePresenterProtocol {
    func logout()
}

class ProfilePresenter: ObservableObject, ProfilePresenterProtocol {
    @Published var name: String = "John"
    @Published var surname: String = "Doe"
    @Published var region: String = "Moscow"

    var interactor: ProfileInteractorProtocol?
    var router: ProfileRouterProtocol?

    // Initializer for normal use
    init(interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    // Initializer for preview purposes
    init() {}

    func logout() {
        // Perform logout logic
    }
}
