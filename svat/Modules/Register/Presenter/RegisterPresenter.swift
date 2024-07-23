import Foundation
import SwiftUI

class RegisterPresenter: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var registerSuccess: Bool = false
    
    var interactor: RegisterInteractor?
    var router: RegisterRouter?
    
    func register() {
        interactor?.register(username: username, password: password)
    }
    
    func didRegister(success: Bool) {
        registerSuccess = success
        if success {
            // Navigate to the next screen
        } else {
            // Show error message
        }
    }
}
