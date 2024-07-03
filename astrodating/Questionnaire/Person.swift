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
