import Foundation

protocol LoginInteractorProtocol {
//    func login(username: String, password: String)
    func login(username: String, password: String, completion: @escaping (Bool, String) -> Void)
}

class LoginInteractor: LoginInteractorProtocol {
    var entryPresenter: EntryPresenter

    init(entryPresenter: EntryPresenter) {
        self.entryPresenter = entryPresenter
    }

    func login(username: String, password: String, completion: @escaping (Bool, String) -> Void) {
//    func login(username: String, password: String) {
        // Perform login logic
        if username == "123" && password == "admin" {
            entryPresenter.currentRoute = "list"
            completion(true, "")
        } else {
            completion(false, "Invalid username or password.")
            // Handle login failure
        }
    }
}
