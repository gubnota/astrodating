import SwiftUI

struct QuestionnaireView: View {
    @ObservedObject var presenter: QuestionnairePresenter
    var router: QuestionnaireRouter
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("Анкета"))
                .font(.largeTitle)
                .padding()
            
            if presenter.questionsLoaded {
                List(presenter.questions, id: \.self) { question in
                    Text(question)
                }
                
                Button(action: {
                    router.navigateToNext()
                }) {
                    Text(LocalizedStringKey("Следующий"))
                        .foregroundColor(.blue)
                        .padding()
                }
            } else {
                Text(LocalizedStringKey("Загрузка вопросов..."))
                    .font(.title)
                    .padding()
                
                Button(action: {
                    presenter.loadQuestions()
                }) {
                    Text(LocalizedStringKey("Загрузить вопросы"))
                        .foregroundColor(.blue)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireAssembly.assemble()
    }
}
