import Foundation
import SwiftUI

class LoginPresenter: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginSuccess: Bool = false
    
    var interactor: LoginInteractor?
    var router: LoginRouter?
    
    func login() {
        interactor?.login(username: username, password: password)
    }
    
    func didLogin(success: Bool) {
        loginSuccess = success
        if success {
            // Navigate to the next screen
        } else {
            // Show error message
        }
    }
}
