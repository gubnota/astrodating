import SwiftUI

struct ProfileView: View {
    @ObservedObject var presenter: ProfilePresenter

    var body: some View {
        VStack(spacing: 20) {
            Text(LocalizedStringKey("Profile"))
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Image("profile_image")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.primary, lineWidth: 4))

            VStack(alignment: .leading, spacing: 10) {
                Text(LocalizedStringKey("Name: \(presenter.name)"))
                Text(LocalizedStringKey("Surname: \(presenter.surname)"))
                Text(LocalizedStringKey("Region: \(presenter.region)"))
            }
            .padding()

            Spacer()

            Button(action: {
                presenter.logout()
            }) {
                Text(LocalizedStringKey("Logout"))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presenter: ProfilePresenter(interactor: ProfileInteractor(presenter: ProfilePresenter()), router: ProfileRouter()))
    }
}
