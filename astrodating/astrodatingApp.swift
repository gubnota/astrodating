//
//  astrodatingApp.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

@main
struct astrodatingApp: App {
    var body: some Scene {
        WindowGroup {
            QuestionnaireView(viewModel: QuizViewModel())//LoginView()//ContentView
        }
    }
}
