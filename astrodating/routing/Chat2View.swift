import SwiftUI

struct Chat2View: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            Text("Chat")
                .font(.largeTitle)
                .padding()

            Button("Back to User List") {
                viewModel.currentRoute = "list"
            }
            .padding()
        }
    }
}
