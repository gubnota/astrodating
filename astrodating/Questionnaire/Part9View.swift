
import SwiftUI

struct Part9View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Расскажите о себе")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                TextEditor(text: $viewModel.selfIntro)
                    .frame(height: 200)
                    .padding()
//                    .background(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#FD80C3"), lineWidth: 4)
                    )
//                    .cornerRadius(6)
//                    .padding(.bottom, 10)

                Spacer().frame(height: 50)
            }
//            .padding(.horizontal)
        }
    }
}

struct Part9View_Previews: PreviewProvider {
    static var previews: some View {
        Part9View(viewModel: QuizViewModel())
    }
}
