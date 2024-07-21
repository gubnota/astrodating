
import SwiftUI

struct Part8View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Выберите способ поиска партнера")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Метод поиска", selection: $viewModel.partnerMethod) {
                    ForEach(viewModel.partnerMethods) { method in
                        Text(method.name).tag(method.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
//            .padding(.horizontal)
        }
    }
}

struct Part8View_Previews: PreviewProvider {
    static var previews: some View {
        Part8View(viewModel: QuizViewModel())
    }
}
