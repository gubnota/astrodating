import Foundation

protocol EntryInteractorProtocol {
    var presenter: (any EntryPresenterProtocol)? { get set }
    func loadInitialData()
}

class EntryInteractor: EntryInteractorProtocol {
    var presenter: (any EntryPresenterProtocol)?

    func loadInitialData() {
        // Perform data loading logic
        presenter?.didLoadInitialData()
    }
}
