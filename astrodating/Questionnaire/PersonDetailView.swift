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
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()

            Text(person.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Text("Астрологический знак: \(person.astrologicalSign)")
            Text("Китайский зодиак: \(person.chineseZodiac)")
            Text("Регион: \(person.region)")
            Text("Язык любви: \(person.loveLanguage)")

            Spacer()

            NavigationLink(destination: ChatView(person: person)) {
                Text("Чат")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePerson = Person(name: "Иван Кублаханов", imageName: "john_smith", astrologicalSign: "Овен", chineseZodiac: "Дракон", region: "Нижний Новгород", loveLanguage: "Время")
        PersonDetailView(person: samplePerson)
    }
}
