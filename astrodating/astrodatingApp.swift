//
//  astrodatingApp.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

@main
struct astrodatingApp: App {
    @StateObject private var viewModel = EntryViewModel()

    var body: some Scene {
        WindowGroup {
           EntryView(viewModel: QuizViewModel())//QuestionnaireView(viewModel: QuizViewModel())//LoginView()//ContentView
//                .edgesIgnoringSafeArea(.all) 
        }
    }
}
