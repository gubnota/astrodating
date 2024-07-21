import SwiftUI

struct Profile2View: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()

            Button("Back to User List") {
                viewModel.currentRoute = "list"
            }
            .padding()
        }
    }
}
