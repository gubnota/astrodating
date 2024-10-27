import SwiftUI

struct Part3View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Астрологический знак и Китайский зодиак")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Астрологический знак", selection: $viewModel.astroSign) {
                    ForEach(viewModel.astroSigns) { sign in
                        Text(sign.name).tag(sign.id)
                    }
                }
                .styledPicker()
                
                Picker("Китайский зодиак", selection: $viewModel.chineseZodiac) {
                    ForEach(viewModel.chineseZodiacs) { zodiac in
                        Text(zodiac.name).tag(zodiac.id)
                    }
                }
                .styledPicker()
                Spacer().frame(height: 50)
            }
//            .padding(.horizontal)
        }
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View(viewModel: QuizViewModel())
    }
}
