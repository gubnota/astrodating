import SwiftUI

struct Part6View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Введите свои контакты")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                TextField("Телефон", text: $viewModel.tel)
                    .styledTextField()
                
                TextField("VK", text: $viewModel.vk)
                    .styledTextField()
                
                TextField("OK", text: $viewModel.ok)
                    .styledTextField()
                
                TextField("Facebook", text: $viewModel.facebook)
                    .styledTextField()
                
                TextField("Instagram", text: $viewModel.instagram)
                    .styledTextField()
                
                TextField("Telegram", text: $viewModel.telegram)
                    .styledTextField()
                
                TextField("Skype", text: $viewModel.skype)
                    .styledTextField()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part6View_Previews: PreviewProvider {
    static var previews: some View {
        Part6View(viewModel: QuizViewModel())
    }
}
