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
