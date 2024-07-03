import SwiftUI

struct Part3View: View {
    @Binding var dateOfBirth: Date
    @State private var astrologicalSign = "Aries"
    @State private var chineseZodiac = "Rat"

    var body: some View {
        VStack {
            Text("Astrological Sign: \(calculateAstrologicalSign(date: dateOfBirth))")
                .padding()

            Text("Chinese Zodiac: \(calculateChineseZodiac(date: dateOfBirth))")
                .padding()

            Picker("Astrological Sign", selection: $astrologicalSign) {
                ForEach(astrologicalSigns, id: \.self) { sign in
                    Text(sign)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Picker("Chinese Zodiac", selection: $chineseZodiac) {
                ForEach(chineseZodiacSigns, id: \.self) { sign in
                    Text(sign)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            NavigationLink(destination: Part4View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 3")
        .navigationBarTitleDisplayMode(.inline)
    }
}

func calculateAstrologicalSign(date: Date) -> String {
    // Implement the logic to calculate astrological sign based on date
    return "Aries"
}

func calculateChineseZodiac(date: Date) -> String {
    // Implement the logic to calculate Chinese zodiac sign based on date
    return "Rat"
}

let astrologicalSigns = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
let chineseZodiacSigns = ["Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig"]

struct Part3View_Previews: PreviewProvider {
    @State static var dateOfBirth = Date()
    static var previews: some View {
        Part3View(dateOfBirth: $dateOfBirth)
    }
}
