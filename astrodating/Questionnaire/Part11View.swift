
import SwiftUI

struct Part11View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Дата предыдущих отношений")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                DatePicker("Дата", selection: $viewModel.previousRelationshipDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .styledDatePicker()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part11View_Previews: PreviewProvider {
    static var previews: some View {
        Part11View(viewModel: QuizViewModel())
    }
}
