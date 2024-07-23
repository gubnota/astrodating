import SwiftUI

struct Part1View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {

                TextField("Имя", text: $viewModel.name)
                    .styledTextField()

                TextField("Фамилия", text: $viewModel.surname)
                    .styledTextField()

                Picker("Пол", selection: $viewModel.gender) {
                    Text("Мужской").tag(1)
                    Text("Женский").tag(2)
                }
                .styledPicker()

//                RegionSelectorView(viewModel: viewModel)
//                    .padding()
                Picker("Регион", selection: $viewModel.region) {
                    ForEach(viewModel.regions, id: \.id) { region in
                        Text(region.name).tag(region.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
//            .padding(.horizontal)
        }
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View(viewModel: QuizViewModel())
    }
}
