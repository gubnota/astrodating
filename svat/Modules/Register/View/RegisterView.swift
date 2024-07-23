import SwiftUI

struct RegisterView: View {
    @ObservedObject var presenter: RegisterPresenter

    var body: some View {
        VStack {
            Text(LocalizedStringKey("Register"))
                .font(.largeTitle)
                .padding()

            TextField(LocalizedStringKey("Username"), text: $presenter.username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            SecureField(LocalizedStringKey("Password"), text: $presenter.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            Button(action: {
                presenter.register()
            }) {
                Text(LocalizedStringKey("Register"))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }

            Spacer()
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(presenter: RegisterPresenter())
    }
}
