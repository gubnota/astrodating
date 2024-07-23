import Foundation
import SwiftUI

//class LoginPresenter: ObservableObject {
//    @Published var username: String = ""
//    @Published var password: String = ""
//    @Published var loginSuccess: Bool = false
//    
//    var entryPresenter: EntryPresenter // to set the route
//    var interactor: LoginInteractor?
//    var router: LoginRouter?
//
//    init(entryPresenter: EntryPresenter) {
//        self.entryPresenter = entryPresenter
//    }
//    
//    func login() {
//        interactor?.login(username: username, password: password)
//    }
//    
//    func didLogin(success: Bool) {
//        loginSuccess = success
//        if success {
//            // Navigate to the next screen
//        } else {
//            // Show error message
//        }
//    }
//}
class LoginPresenter: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    var interactor: LoginInteractorProtocol

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }

    func login() {
        interactor.login(username: username, password: password)
    }
}
