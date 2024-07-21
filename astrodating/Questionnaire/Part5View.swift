import SwiftUI

struct Part5View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Выберите семейное положение")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Семейное положение", selection: $viewModel.maritalStatus) {
                    ForEach(viewModel.maritalStatuses) { status in
                        Text(status.name).tag(status.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View(viewModel: QuizViewModel())
    }
}
