import Foundation

class LoginInteractor {
    private let presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
    }
    
    func login(username: String, password: String) {
        // Perform login logic
        presenter.didLogin(success: true)
    }
}
