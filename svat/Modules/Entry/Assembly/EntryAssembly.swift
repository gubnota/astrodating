import SwiftUI

class EntryAssembly {
    static func assemble() -> some View {
        let interactor = EntryInteractor()
        let router = EntryRouter()
        let presenter = EntryPresenter(interactor: interactor, router: router)
        return EntryView(presenter: presenter)
    }
}
