import SwiftUI

struct Part7View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Укажите свои предпочтения")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                TextField("Запросы и пожелания", text: $viewModel.assistance)
                    .styledTextField()
                
                Text("Желаемый возраст партнера")
                    .font(.headline)
                
                Slider(value: Binding(
                    get: { Double(viewModel.ageRange.lowerBound) },
                    set: { viewModel.ageRange = Int($0)...viewModel.ageRange.upperBound }
                ), in: 18...100, step: 1)
                
                Slider(value: Binding(
                    get: { Double(viewModel.ageRange.upperBound) },
                    set: { viewModel.ageRange = viewModel.ageRange.lowerBound...Int($0) }
                ), in: 18...100, step: 1)

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part7View_Previews: PreviewProvider {
    static var previews: some View {
        Part7View(viewModel: QuizViewModel())
    }
}
