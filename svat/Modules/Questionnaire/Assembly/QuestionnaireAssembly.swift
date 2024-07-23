import SwiftUI

class QuestionnaireAssembly {
    static func assemble() -> some View {
        let presenter = QuestionnairePresenter()
        let router = QuestionnaireRouter()
        let interactor = QuestionnaireInteractor(presenter: presenter)
        presenter.interactor = interactor
        presenter.router = router
        return QuestionnaireView(presenter: presenter, router: router)
    }
}
