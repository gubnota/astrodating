import SwiftUI

struct Part10View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Укажите рост и вес")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                TextField("Рост (см)", text: $viewModel.height)
                    .styledTextField()
                
                TextField("Вес (кг)", text: $viewModel.weight)
                    .styledTextField()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part10View_Previews: PreviewProvider {
    static var previews: some View {
        Part10View(viewModel: QuizViewModel())
    }
}
