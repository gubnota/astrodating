//
//  EntryyView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI

struct EntryView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.currentRoute {
                case "list":
                    UserListView(users: sampleUsers)
                case "chat":
                    if let person = sampleUsers.first { // Assuming you want to chat with the first person for demo purposes
                        ChatView(person: person)
                    }
                case "register":
                    RegisterView()
                case "profile":
                    ProfileView(viewModel: viewModel)
                case "detail":
                    if let person = sampleUsers.first { // Assuming you want to show details of the first person for demo purposes
                        PersonDetailView(person: person)
                    }
                default:
                    LoginView(viewModel: viewModel)
                }
            }
        }
//        .navigationBarHidden(true) // Hide the navigation bar
//        .navigationBarTitle("", displayMode: .inline) // Set title to empty string
        .onAppear {
            viewModel.deserializeFromJson()
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(viewModel: QuizViewModel())
    }
}
