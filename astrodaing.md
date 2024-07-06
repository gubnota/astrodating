`./QuestionnaireView.swift`:
```swift
//
//  QuestionnaireView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//

import SwiftUI

struct QuestionnaireView: View {
    @State private var currentPart = 1
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var gender: String = "Male"
    @State private var region: String = "Moscow"
    @State private var dateOfBirth = Date()
    @State private var astroSign: String = "Aries"
    @State private var chineseZodiac: String = "Rat"
    @State private var loveLanguage1: String = "Approval"
    @State private var loveLanguage2: String = "Touch"
    @State private var maritalStatus: String = "Single"
    @State private var tel: String = ""
    @State private var vk: String = ""
    @State private var ok: String = ""
    @State private var facebook: String = ""
    @State private var instagram: String = ""
    @State private var telegram: String = ""
    @State private var skype: String = ""
    @State private var assistance: String = ""
    @State private var ageRange: ClosedRange<Int> = 18...50
    @State private var partnerMethod: String = "Actively Looking"
    @State private var selfIntro: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var previousRelationshipDate = Date()
    @State private var photos: [UIImage] = []
    @State private var badHabits: String = "I don't"
    @State private var hasChildren: String = "I don't"
    @State private var exChineseZodiac: String = "Rat"
    @State private var exAstroSign: String = "Aries"

    var body: some View {
        VStack {
            if currentPart == 1 {
                Part1View(name: $name, surname: $surname, gender: $gender, region: $region)
            } else if currentPart == 2 {
                Part2View(dateOfBirth: $dateOfBirth)
            } else if currentPart == 3 {
                Part3View(dateOfBirth: $dateOfBirth)//astroSign: $astroSign, chineseZodiac: $chineseZodiac)
            } else if currentPart == 4 {
                Part4View()//loveLanguage1: $loveLanguage1)
            } else if currentPart == 5 {
                Part5View()//loveLanguage2: $loveLanguage2)
            } else if currentPart == 6 {
                Part6View()//maritalStatus: $maritalStatus)
            } else if currentPart == 7 {
                Part7View()//tel: $tel, vk: $vk, ok: $ok, facebook: $facebook, instagram: $instagram, telegram: $telegram, skype: $skype)
            } else if currentPart == 8 {
                Part8View()//assistance: $assistance, ageRange: $ageRange)
            } else if currentPart == 9 {
                Part9View()//partnerMethod: $partnerMethod)
            } else if currentPart == 10 {
                Part10View()//selfIntro: $selfIntro)
            } else if currentPart == 11 {
                Part11View()//height: $height, weight: $weight)
            } else if currentPart == 12 {
                Part12View()//previousRelationshipDate: $previousRelationshipDate)
            } else if currentPart == 13 {
                Part13View()//photos: $photos)
            } else if currentPart == 14 {
                Part14View()//badHabits: $badHabits)
            } else if currentPart == 15 {
                Part15View()//hasChildren: $hasChildren)
            } else if currentPart == 16 {
                Part16View()//exChineseZodiac: $exChineseZodiac, exAstroSign: $exAstroSign)
            }

            HStack {
                if currentPart > 1 {
                    Button("Previous") {
                        currentPart -= 1
                    }
                    .padding()
                }

                Spacer()

                if currentPart < 16 {
                    Button("Next") {
                        currentPart += 1
                    }
                    .padding()
                } else {
                    Button("Finish") {
                        // Handle completion
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

#Preview {
    QuestionnaireView()
}
```

`User/NavigationLinkModifier.swift`:
```swift
//
//  NavigationLinkModifier.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct NavigationLinkModifier<Destination: View>: ViewModifier {
    let destination: Destination
    @Binding var isActive: Bool

    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destination, isActive: $isActive) {
                    EmptyView()
                }
                .hidden()
            )
    }
}

extension View {
    func navigate<Destination: View>(to destination: Destination, when binding: Binding<Bool>) -> some View {
        self.modifier(NavigationLinkModifier(destination: destination, isActive: binding))
    }
}```

`User/UserListView.swift`:
```swift
//
//  UserListView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct UserListView: View {
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
            .navigationTitle("Potential Matches")
        }
    }
}

struct UserCardView: View {
    var person: Person

    var body: some View {
        VStack {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
            Text(person.name)
                .font(.headline)
            Text(person.region)
                .font(.subheadline)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUsers = [
            Person(name: "John Doe", imageName: "john_doe", astrologicalSign: "Gemini", chineseZodiac: "Rat", region: "Saint Petersburg", loveLanguage: "Acts of Service"),
            Person(name: "Jane Smith", imageName: "jane_smith", astrologicalSign: "Leo", chineseZodiac: "Ox", region: "Moscow", loveLanguage: "Physical Touch")
        ]
        UserListView(users: sampleUsers)
    }
}```

`User/LoginView.swift`:
```swift
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
```

`User/RegisterView.swift`:
```swift
//
//  RegisterView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isQuestionnaireStarted = false

    var body: some View {
        VStack {
            Text("Register")
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
                // Implement registration logic here
                isQuestionnaireStarted = true
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .padding()
        .navigate(to: QuestionnaireView(), when: $isQuestionnaireStarted)
    }
}```

`User/ChatView.swift`:
```swift
//
//  ChatView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct ChatView: View {
    var person: Person
    @State private var messageText = ""
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()

            HStack {
                TextField("Enter message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding()
        }
        .navigationTitle("Chat with \(person.name)")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        messages.append(messageText)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePerson = Person(name: "Sample Person", imageName: "sampleImage", astrologicalSign: "Aries", chineseZodiac: "Dragon", region: "Moscow", loveLanguage: "Quality Time")
        ChatView(person: samplePerson)
    }
}```

`./Slide.swift`:
```swift
//
//  Slide.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

struct Slide: View {
    var imageName: String
    var leftText: String
    var rightText: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
            
            VStack {
                if #available(iOS 16.0, *) {
                    Text(leftText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Adjust padding to respect safe area
                } else {
                    Text(leftText)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Adjust padding to respect safe area
                }
                
                Spacer()
                
                if #available(iOS 16.0, *) {
                    Text(rightText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60) // Adjust the padding as necessary to position it above the bottom edge
                } else {
                    Text(rightText)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60) // Adjust the padding as necessary to position it above the bottom edge
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
```

`Questionnaire/Part4View.swift`:
```swift
import SwiftUI

struct Part4View: View {
    @State private var selectedLoveLanguage = ""

    var body: some View {
        VStack {
            Text("Select your main love language")
                .font(.title2)
                .padding()

            Picker("Love Language", selection: $selectedLoveLanguage) {
                ForEach(loveLanguages, id: \.self) { language in
                    Text(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: ContentView()) {
                Text("Show Initial Content")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: Part5View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 4")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let loveLanguages = ["Approval", "Time", "Help", "Presents"]

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
```

`Questionnaire/Part9View.swift`:
```swift
//
//  Part9View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part9View: View {
    @State private var pursuitMethod = ""

    var body: some View {
        VStack {
            Text("What method do you use to pursue your partner?")
                .font(.title2)
                .padding()

            Picker("Pursuit Method", selection: $pursuitMethod) {
                ForEach(pursuitMethods, id: \.self) { method in
                    Text(method)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part10View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 9")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let pursuitMethods = ["Actively Looking", "Passively Waiting", "Consultation", "Meeting"]

struct Part9View_Previews: PreviewProvider {
    static var previews: some View {
        Part9View()
    }
}```

`Questionnaire/Part2View.swift`:
```swift
//
//  Part2View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part2View: View {
    @Binding var dateOfBirth: Date

    var body: some View {
        VStack {
            DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            NavigationLink(destination: Part3View(dateOfBirth: $dateOfBirth)) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 2")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part2View_Previews: PreviewProvider {
    @State static var dateOfBirth = Date()
    static var previews: some View {
        Part2View(dateOfBirth: $dateOfBirth)
    }
}
```

`Questionnaire/Part11View.swift`:
```swift
//
//  Part11View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part11View: View {
    @State private var height: Double = 170.0
    @State private var weight: Double = 70.0

    var body: some View {
        VStack {
            Text("Height (cm): \(Int(height))")
                .padding()
            
            Slider(value: $height, in: 100...250, step: 1)
                .padding()

            Text("Weight (kg): \(Int(weight))")
                .padding()

            Slider(value: $weight, in: 30...200, step: 1)
                .padding()

            NavigationLink(destination: Part12View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 11")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part11View_Previews: PreviewProvider {
    static var previews: some View {
        Part11View()
    }
}```

`Questionnaire/ListView.swift`:
```swift
//
//  ListView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//
import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(0..<20) { index in
                        NavigationLink(destination: PersonDetailView(person: Person(name: "", imageName: "", astrologicalSign: "", chineseZodiac: "", region: "", loveLanguage: ""))) {
                            Text("Person \(index + 1)")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(5)
                        }
                    }
                }
            }
            .navigationTitle("Possible Matches")
        }
    }
}

//struct ListView: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                    ForEach(samplePersons) { person in
//                        NavigationLink(destination: PersonDetailView(person: person)) {
//                            VStack {
//                                Image(person.imageName)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 150)
//                                    .clipShape(Circle())
//                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                                    .shadow(radius: 5)
//                                Text(person.name)
//                                    .font(.headline)
//                            }
//                            .padding()
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Potential Matches")
//        }
//    }
//}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
```

`Questionnaire/Person.swift`:
```swift
//
//  Person.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import Foundation

let samplePersons = [
    Person(name: "John Doe", imageName: "john_doe", astrologicalSign: "Gemini", chineseZodiac: "Rat", region: "Saint Petersburg", loveLanguage: "Acts of Service"),
    Person(name: "Jane Smith", imageName: "jane_smith", astrologicalSign: "Leo", chineseZodiac: "Ox", region: "Moscow", loveLanguage: "Physical Touch")
]

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let astrologicalSign: String
    let chineseZodiac: String
    let region: String
    let loveLanguage: String
}
```

`Questionnaire/Part5View.swift`:
```swift
//
//  Part5View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part5View: View {
    @State private var selectedLoveLanguage = ""

    var body: some View {
        VStack {
            Text("Select your second love language")
                .font(.title2)
                .padding()

            Picker("Love Language", selection: $selectedLoveLanguage) {
                ForEach(loveLanguages, id: \.self) { language in
                    Text(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part6View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 5")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}```

`Questionnaire/Part8View.swift`:
```swift
import SwiftUI

struct Part8View: View {
    @State private var assistance = ""
    @State private var ageRange = 18.0...30.0

    var body: some View {
        VStack {
            Text("What kind of assistance are you looking for?")
                .padding()
            
            TextEditor(text: $assistance)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding()

            Text("Desired age range for a partner")
                .padding()

//            RangeSlider.
//            (range: $ageRange, in: 18...100)
//                .padding()

            NavigationLink(destination: Part9View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 8")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ModifiableClosedRange {
    var lowerBound: Double
    var upperBound: Double

    init(_ range: ClosedRange<Double>) {
        self.lowerBound = range.lowerBound
        self.upperBound = range.upperBound
    }

    var range: ClosedRange<Double> {
        return self.lowerBound...self.upperBound
    }
}

struct RangeSlider: View {
    @State private var modifiableRange = ModifiableClosedRange(0...100)

    var body: some View {
        VStack {
            Text("Age: \(Int(modifiableRange.lowerBound)) - \(Int(modifiableRange.upperBound))")
                .padding()

            Slider(value: $modifiableRange.lowerBound, in: 0...100, step: 1)
            Slider(value: $modifiableRange.upperBound, in: 0...100, step: 1)
        }
    }
}
struct Part8View_Previews: PreviewProvider {
    static var previews: some View {
        Part8View()
    }
}
```

`Questionnaire/Part16View.swift`:
```swift
//
//  Part16View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part16View: View {
    @State private var exChineseZodiac = ""
    @State private var exAstrologicalSign = ""

    var body: some View {
        VStack {
            Text("Describe your ex (if any)")
                .font(.title2)
                .padding()

            Picker("Chinese Zodiac", selection: $exChineseZodiac) {
                ForEach(chineseZodiacSigns, id: \.self) { sign in
                    Text(sign)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Picker("Astrological Sign", selection: $exAstrologicalSign) {
                ForEach(astrologicalSigns, id: \.self) { sign in
                    Text(sign)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            NavigationLink(destination: ListView()) {
                Text("Finish")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 16")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part16View_Previews: PreviewProvider {
    static var previews: some View {
        Part16View()
    }
}```

`Questionnaire/Part3View.swift`:
```swift
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
```

`Questionnaire/Part10View.swift`:
```swift
//
//  Part10View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part10View: View {
    @State private var selfIntro = ""

    var body: some View {
        VStack {
            Text("Introduce Yourself")
                .padding()
            
            TextEditor(text: $selfIntro)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding()

            NavigationLink(destination: Part11View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 10")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part10View_Previews: PreviewProvider {
    static var previews: some View {
        Part10View()
    }
}
```

`Questionnaire/Part6View.swift`:
```swift
//
//  Part6View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part6View: View {
    @State private var maritalStatus = ""

    var body: some View {
        VStack {
            Text("Select your marital status")
                .font(.title2)
                .padding()

            Picker("Marital Status", selection: $maritalStatus) {
                ForEach(maritalStatuses, id: \.self) { status in
                    Text(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part7View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 6")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let maritalStatuses = ["Single", "Married"]

struct Part6View_Previews: PreviewProvider {
    static var previews: some View {
        Part6View()
    }
}```

`Questionnaire/Part15View.swift`:
```swift
//
//  Part15View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part15View: View {
    @State private var hasChildren = ""

    var body: some View {
        VStack {
            Text("Do you have children?")
                .font(.title2)
                .padding()

            Picker("Children", selection: $hasChildren) {
                ForEach(childrenOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part16View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 15")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let childrenOptions = ["I do", "I don't", "Don't want to tell"]

struct Part15View_Previews: PreviewProvider {
    static var previews: some View {
        Part15View()
    }
}
```

`Questionnaire/Part13View.swift`:
```swift
//
//  Part13View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI
import PhotosUI

struct Part13View: View {
    @State private var selectedPhotos: [UIImage] = []

    var body: some View {
        VStack {
//            PhotosPicker("Select Photos", selection: $selectedPhotos, maxSelectionCount: 4, matching: .images) {
//                Text("Select Photos")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()

            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedPhotos, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .padding()

            NavigationLink(destination: Part14View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 13")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part13View_Previews: PreviewProvider {
    static var previews: some View {
        Part13View()
    }
}
```

`Questionnaire/Part7View.swift`:
```swift
//
//  Part7View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part7View: View {
    @State private var tel = ""
    @State private var vkLink = ""
    @State private var okLink = ""
    @State private var fbLink = ""
    @State private var igLink = ""
    @State private var telegramLink = ""
    @State private var skype = ""

    var body: some View {
        VStack {
            TextField("Telephone", text: $tel)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("VK Link", text: $vkLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("OK Link", text: $okLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Facebook Link", text: $fbLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Instagram Link", text: $igLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Telegram Link", text: $telegramLink)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Skype", text: $skype)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            NavigationLink(destination: Part8View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 7")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct Part7View_Previews: PreviewProvider {
    static var previews: some View {
        Part7View()
    }
}```

`Questionnaire/PersonDetailView.swift`:
```swift
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

            Text("Astrological Sign: \(person.astrologicalSign)")
            Text("Chinese Zodiac: \(person.chineseZodiac)")
            Text("Region: \(person.region)")
            Text("Love Language: \(person.loveLanguage)")

            Spacer()

            NavigationLink(destination: ChatView(person: person)) {
                Text("Chat")
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
        let samplePerson = Person(name: "Sample Person", imageName: "sampleImage", astrologicalSign: "Aries", chineseZodiac: "Dragon", region: "Moscow", loveLanguage: "Quality Time")
        PersonDetailView(person: samplePerson)
    }
}
```

`Questionnaire/Part14View.swift`:
```swift
//
//  Part14View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part14View: View {
    @State private var badHabits = ""

    var body: some View {
        VStack {
            Text("Do you have any bad habits?")
                .font(.title2)
                .padding()

            Picker("Bad Habits", selection: $badHabits) {
                ForEach(badHabitOptions, id: \.self) { habit in
                    Text(habit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: Part15View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 14")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let badHabitOptions = ["I smoke", "I don't", "Don't want to tell"]

struct Part14View_Previews: PreviewProvider {
    static var previews: some View {
        Part14View()
    }
}```

`Questionnaire/Part1View.swift`:
```swift
//
//  Part1View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part1View: View {
    @Binding var name: String
    @Binding var surname: String
    @Binding var gender: String
    @Binding var region: String

    var body: some View {
        VStack {
            Text("Part 1")
                .font(.largeTitle)
                .padding()

            TextField("Name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            TextField("Surname", text: $surname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)

            Picker("Gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TextField("Region", text: $region)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
        }
    }
}```

`Questionnaire/Part12View.swift`:
```swift
//
//  Part12View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct Part12View: View {
    @State private var endOfPreviousRelationship = Date()

    var body: some View {
        VStack {
            DatePicker("End of Previous Relationship", selection: $endOfPreviousRelationship, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            NavigationLink(destination: Part13View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 12")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part12View_Previews: PreviewProvider {
    static var previews: some View {
        Part12View()
    }
}```

`./astrodatingApp.swift`:
```swift
//
//  astrodatingApp.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

@main
struct astrodatingApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()//ContentView
        }
    }
}
```

`./ContentView.swift`:
```swift
import SwiftUI
import AVFoundation

class AudioPlayer: ObservableObject {
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "_6hY6tJUDJA", withExtension: "m4a") else {
            print("Audio file not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    @State private var currentSlideIndex = 0
    @State private var isAutoPlayEnabled = false
    let totalSlides = 5
    let autoPlayInterval = 3.0
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    let leftTexts = ["ОДОБРЕНИЕ", "ВРЕМЯ", "ПОДАРКИ", "ПОМОЩЬ", "ФИЗИЧЕСКИЙ КОНТАКТ"]
    let rightTexts = ["подбадривание, комплименты, поддержка", "внимание, время проведенное вместе, поддержка", "подарки, сюрпризы, впечатления", "помощь в делах, вкусняшки", "объятия, прикосновения, поглаживания"]
    
    @StateObject private var audioPlayer = AudioPlayer()

    var body: some View {
        VStack {
            // Slide selector bars at the top
            HStack {
                ForEach(0..<totalSlides, id: \.self) { index in
                    Rectangle()
                        .fill(index == currentSlideIndex ? Color.white : Color.gray)
                        .frame(height: 5)
                }
            }
            .padding(.horizontal)
//            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Adjust padding to respect safe area
            
            TabView(selection: $currentSlideIndex) {
                ForEach(0..<totalSlides, id: \.self) { index in
                    Slide(imageName: "p0\(index+1)", leftText: leftTexts[index], rightText: rightTexts[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onReceive(timer) { _ in
            guard isAutoPlayEnabled else { return }
            self.currentSlideIndex = (self.currentSlideIndex + 1) % self.totalSlides
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // To make the background black for contrast
        .onAppear {
//            audioPlayer.playSound()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

