
import SwiftUI

struct Part15View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Опишите своего бывшего партнера")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Китайский знак зодиака", selection: $viewModel.exChineseZodiac) {
                    ForEach(viewModel.chineseZodiacs) { sign in
                        Text(sign.name).tag(sign.id)
                    }
                }
                .styledPicker()

                Picker("Знак зодиака", selection: $viewModel.exAstroSign) {
                    ForEach(viewModel.astroSigns) { sign in
                        Text(sign.name).tag(sign.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part15View_Previews: PreviewProvider {
    static var previews: some View {
        Part15View(viewModel: QuizViewModel())
    }
}
