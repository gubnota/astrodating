import Foundation

class ProfileInteractor: ProfileInteractorProtocol {
    private var presenter: ProfilePresenter?

    init(presenter: ProfilePresenter) {
        self.presenter = presenter
    }

    func performLogout() {
        // Perform logout operation
    }
}
