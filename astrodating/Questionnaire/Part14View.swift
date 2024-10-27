import SwiftUI

struct Part14View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Есть ли у вас дети?")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Дети", selection: $viewModel.hasChildren) {
                    ForEach(viewModel.hasChildrenList) { option in
                        Text(option.name).tag(option.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
        }
    }
}

struct Part14View_Previews: PreviewProvider {
    static var previews: some View {
        Part14View(viewModel: QuizViewModel())
    }
}
