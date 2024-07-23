import Foundation

class RegisterInteractor {
    private let presenter: RegisterPresenter
    
    init(presenter: RegisterPresenter) {
        self.presenter = presenter
    }
    
    func register(username: String, password: String) {
        // Perform registration logic
        presenter.didRegister(success: true)
    }
}
