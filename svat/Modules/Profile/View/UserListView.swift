import SwiftUI

struct UserListView: View {
    var users: [Person]

    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: PersonDetailView(person: user)) {
                    UserRowView(user: user)
                }
            }
            .navigationTitle("User List")
        }
    }
}

struct UserRowView: View {
    var user: Person

    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.primary, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.region)
                    .font(.subheadline)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(users: sampleUsers)
    }
}
