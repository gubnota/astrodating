
import SwiftUI

struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? "checkbox_true" : "checkbox") // Initial state
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
//                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}


struct Part15View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var showPickers = false // Add a state property for the toggle

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Опишите своего бывшего партнера")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Toggle(isOn: $showPickers) {
                    Text("Не было")
                }
                .toggleStyle(CustomCheckboxToggleStyle())
            }
            
                // Conditionally show the pickers based on the toggle state
                if !showPickers {
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
            }
                Spacer().frame(height: 50)
            } // Add a Toggle view below the VStack
        }
}


struct Part15View_Previews: PreviewProvider {
    static var previews: some View {
        Part15View(viewModel: QuizViewModel())
    }
}
