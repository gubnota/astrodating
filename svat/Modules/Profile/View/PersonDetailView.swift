import SwiftUI

struct PersonDetailView: View {
    var person: Person

    var body: some View {
        VStack {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.primary, lineWidth: 4))
                .padding()

            Text(person.name)
                .font(.largeTitle)
                .padding(.top)

            VStack(alignment: .leading, spacing: 10) {
                Text("Astrological Sign: \(person.astrologicalSign)")
                Text("Chinese Zodiac: \(person.chineseZodiac)")
                Text("Region: \(person.region)")
                Text("Love Language: \(person.loveLanguage)")
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: sampleUsers[0])
    }
}
