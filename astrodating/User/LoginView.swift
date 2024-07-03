import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
    @State private var isRegistering = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .padding()

                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)

                Button(action: {
                    if username == "user1" && password == "admin" {
                        isLoggedIn = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Login"), message: Text("Username or password is incorrect"), dismissButton: .default(Text("OK")))
                }

                NavigationLink(destination: RegisterView(), isActive: $isRegistering) {
                    Button("Register") {
                        isRegistering = true
                    }
                }
                .padding()
            }
            .padding()
            .navigationBarHidden(true)
        }
        .navigate(to: QuestionnaireView(), when: $isLoggedIn)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
