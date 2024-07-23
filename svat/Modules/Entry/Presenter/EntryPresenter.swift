import SwiftUI

protocol EntryPresenterProtocol: ObservableObject {
    var currentRoute: String { get set }
    func onViewAppear()
    func didLoadInitialData()
}

class EntryPresenter: ObservableObject, EntryPresenterProtocol {
    @Published var currentRoute: String = "login"

    var interactor: EntryInteractorProtocol
    var router: EntryRouterProtocol

    init(interactor: EntryInteractorProtocol, router: EntryRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func didLoadInitialData() {
        // Handle initial data loading logic here
    }

    func onViewAppear() {
        interactor.loadInitialData()
    }
}
