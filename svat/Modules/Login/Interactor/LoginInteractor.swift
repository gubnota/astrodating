import Foundation

protocol LoginInteractorProtocol {
    func login(username: String, password: String)
}

class LoginInteractor: LoginInteractorProtocol {
    var entryPresenter: EntryPresenter

    init(entryPresenter: EntryPresenter) {
        self.entryPresenter = entryPresenter
    }

    func login(username: String, password: String) {
        // Perform login logic
        if username == "123" && password == "admin" {
            entryPresenter.currentRoute = "list"
        } else {
            // Handle login failure
        }
    }
}
