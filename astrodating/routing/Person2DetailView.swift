import SwiftUI

struct Person2DetailView: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            Text("Person Detail")
                .font(.largeTitle)
                .padding()

            Button("Back to User List") {
                viewModel.currentRoute = "list"
            }
            .padding()
        }
    }
}
