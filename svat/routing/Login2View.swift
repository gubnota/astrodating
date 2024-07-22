import SwiftUI

struct Login2View: View {
    @ObservedObject var viewModel: EntryViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()

            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            Button("Login") {
                if username == "user" && password == "password" {
                    viewModel.currentRoute = "list"
                } else {
                    showAlert = true
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Credentials"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
            }
            .padding()

            Button("Register") {
                viewModel.currentRoute = "register"
            }
            .padding()
        }
        .padding()
    }
}
