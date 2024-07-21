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
        let sampleUsers = [
            Person(name: "John Doe", imageName: "john_doe", astrologicalSign: "Gemini", chineseZodiac: "Rat", region: "Saint Petersburg", loveLanguage: "Acts of Service"),
            Person(name: "Jane Smith", imageName: "jane_smith", astrologicalSign: "Leo", chineseZodiac: "Ox", region: "Moscow", loveLanguage: "Physical Touch")
        ]
        ListView(users: sampleUsers)
    }
}
