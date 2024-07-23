import Foundation
import SwiftUI

class QuestionnairePresenter: ObservableObject {
    @Published var questions: [String] = []
    @Published var questionsLoaded: Bool = false
    
    var interactor: QuestionnaireInteractor?
    var router: QuestionnaireRouter?
    
    func loadQuestions() {
        interactor?.loadQuestions()
    }
    
    func didLoadQuestions(success: Bool) {
        questionsLoaded = success
        if success {
            // Update questions data
        } else {
            // Show error message
        }
    }
}
