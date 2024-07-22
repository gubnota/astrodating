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
                .overlay(Circle().stroke(primaryColor, lineWidth: 6))
                .padding()
            Spacer()

            Text(person.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            VStack {
                ForEach([
                    ("Астрологический знак:", person.astrologicalSign),
                    ("Китайский зодиак:", person.chineseZodiac),
                    ("Регион:", person.region),
                    ("Язык любви:", person.loveLanguage)
                ], id: \.0) { item in
                    HStack {
                        Text(item.0)
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                        Text(item.1)
                            .font(.body)
                    }
                    Spacer()
                }
            }
            .padding()

            NavigationLink(destination: ChatView(person: person)) {
                Text("Чат")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
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
        PersonDetailView(person: samplePerson).environmentObject(AppViewModel())
    }
}
