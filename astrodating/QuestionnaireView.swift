//
//  QuestionnaireView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//
import SwiftUI

struct QuestionnaireView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        NavigationView {
            VStack {
                //            switch viewModel.currentStep {
                //            case 1:
                //                Part1View(viewModel: viewModel)
                //            case 2:
                //                Part2View(viewModel: viewModel)
                //            default:
                //                Text("Completed")
                //            }
                // Add other cases for Part3 to Part16
                if viewModel.currentStep == 1 {
                    Part1View(viewModel: viewModel)
                }
                else if viewModel.currentStep == 2 {
                    Part2View(viewModel: viewModel)
                } else if viewModel.currentStep == 3 {
                    Part3View(viewModel: viewModel)
                } else if viewModel.currentStep == 4 {
                    Part4View(viewModel: viewModel)
                } else if viewModel.currentStep == 5 {
                    Part5View(viewModel: viewModel)
                } else if viewModel.currentStep == 6 {
                    Part6View(viewModel: viewModel)
                } else if viewModel.currentStep == 7 {
                    Part7View(viewModel: viewModel)
                } else if viewModel.currentStep == 8 {
                    Part8View(viewModel: viewModel)
                } else if viewModel.currentStep == 9 {
                    Part9View(viewModel: viewModel)
                } else if viewModel.currentStep == 10 {
                    Part10View(viewModel: viewModel)
                } else if viewModel.currentStep == 11 {
                    Part11View(viewModel: viewModel)
                } else if viewModel.currentStep == 12 {
                    Part12View(viewModel: viewModel)
                } else if viewModel.currentStep == 13 {
                    Part13View(viewModel: viewModel)
                } else if viewModel.currentStep == 14 {
                    Part14View(viewModel: viewModel)
                } else if viewModel.currentStep == 15 {
                    Part15View(viewModel: viewModel)
                }
                
            }
        }
        .navigationBarHidden(true) // Hide the navigation bar
        .navigationBarTitle("", displayMode: .inline) // Set title to empty string

    }
        
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView(viewModel: QuizViewModel())
    }
}
