
import SwiftUI

struct Part13View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Есть ли у вас вредные привычки?")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Вредные привычки", selection: $viewModel.badHabits) {
                    ForEach(viewModel.badHabitsList) { habit in
                        Text(habit.name).tag(habit.id)
                    }
                }
                .styledPicker()

                Spacer().frame(height: 50)
            }
            .padding(.horizontal)
        }
    }
}

struct Part13View_Previews: PreviewProvider {
    static var previews: some View {
        Part13View(viewModel: QuizViewModel())
    }
}
