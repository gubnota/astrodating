//
//  Part2View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//
import SwiftUI

struct Part2View: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("День рождения")
                    .font(.largeTitle)
                    .padding()

                DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                    .styledDatePicker()

                Spacer().frame(height: 50)
            }
        }
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View(viewModel: QuizViewModel(properties: ["currentStep":2]))
    }
}
