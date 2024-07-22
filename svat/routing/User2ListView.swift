import SwiftUI

struct User2ListView: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            Text("User List")
                .font(.largeTitle)
                .padding()

            Button("Go to Profile") {
                viewModel.currentRoute = "profile"
            }
            .padding()

            Button("Go to Chat") {
                viewModel.currentRoute = "chat"
            }
            .padding()

            Button("Go to Detail") {
                viewModel.currentRoute = "detail"
            }
            .padding()
        }
    }
}
