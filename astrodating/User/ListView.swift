import SwiftUI

struct ListView: View {
    var users: [Person]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(users) { user in
                        NavigationLink(destination: PersonDetailView(person: user)) {
                            UserCardView(person: user)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Кандидаты")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {

        ListView(users: sampleUsers)
    }
}
