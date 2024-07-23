import Foundation

class QuestionnaireInteractor {
    private let presenter: QuestionnairePresenter
    
    init(presenter: QuestionnairePresenter) {
        self.presenter = presenter
    }
    
    func loadQuestions() {
        // Perform question loading logic
        presenter.didLoadQuestions(success: true)
    }
}
