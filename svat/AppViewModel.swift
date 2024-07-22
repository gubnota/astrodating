import Foundation
class AppViewModel: ObservableObject {
    @Published var currentRoute: String = "home"
    
    // Example functions to change the routing
    func goToHome() {
        currentRoute = "home"
    }
    
    func goToProfile() {
        currentRoute = "profile"
    }
//case "list":
//    UserListView(users: sampleUsers)
//case "chat":
//    if let person = sampleUsers.first { // Assuming you want to chat with the first person for demo purposes
//        ChatView(person: person)
//    }
//case "register":
//    RegisterView(viewModel: viewModel)
//case "profile":
//    ProfileView(viewModel: viewModel)
//case "questionnaire":
//    QuestionnaireView(viewModel: viewModel)
//case "detail":

    
    // Add more navigation functions as needed
}
