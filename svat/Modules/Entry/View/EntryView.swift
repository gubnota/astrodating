import SwiftUI

struct EntryView: View {
    @EnvironmentObject var presenter: EntryPresenter

    var body: some View {
        NavigationView {
            VStack {
                switch presenter.currentRoute {
                case "list":
                    UserListView(users: sampleUsers)
                case "chat":
                    if let person = sampleUsers.first { // Assuming you want to chat with the first person for demo purposes
                        ChatView(person: person)
                    }
                case "register":
                    RegisterAssembly.assemble()
                case "profile":
                    ProfileAssembly.assemble()
                case "questionnaire":
                    QuestionnaireAssembly.assemble()
                case "detail":
                    if let person = sampleUsers.first { // Assuming you want to show details of the first person for demo purposes
                        PersonDetailView(person: person)
                    }
                default:
                    LoginAssembly.assemble(entryPresenter: presenter)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // make iPad version to fill up whole area
        .onAppear {
            presenter.onViewAppear()
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView().environmentObject(EntryPresenter(interactor: EntryInteractor(), router: EntryRouter()))
    }
}
