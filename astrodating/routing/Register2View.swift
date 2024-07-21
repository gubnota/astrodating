import SwiftUI

struct Register2View: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .padding()

            Button("Back to Login") {
                viewModel.currentRoute = "login"
            }
            .padding()
        }
    }
}
