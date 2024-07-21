//
//  QuizViewModel_ext.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//

import Foundation

extension Decodable {
    init?(jsonString: String) throws {
        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
        self = try JSONDecoder().decode(Self.self, from: jsonData)
    }
}

extension QuizViewModel {
    
    convenience init(properties: [String: Any]? = nil) {
        self.init()
        if let properties = properties {
            for (key, value) in properties {
                switch key {
                case "currentStep":
                    self.currentStep = value as? Int ?? 1
                case "name":
                    self.name = value as? String ?? ""
                case "surname":
                    self.surname = value as? String ?? ""
                case "gender":
                    self.gender = value as? Int ?? 1
                case "region":
                    self.region = value as? Int ?? 77
                case "astroSign":
                    self.astroSign = value as? Int ?? 1
                case "chineseZodiac":
                    self.chineseZodiac = value as? Int ?? 1
                case "loveLanguage1":
                    self.loveLanguage1 = value as? Int ?? 1
                case "loveLanguage2":
                    self.loveLanguage2 = value as? Int ?? 1
                case "maritalStatus":
                    self.maritalStatus = value as? Int ?? 1
                case "partnerMethod":
                    self.partnerMethod = value as? Int ?? 1
                case "badHabits":
                    self.badHabits = value as? Int ?? 1
                case "hasChildren":
                    self.hasChildren = value as? Int ?? 1
                case "exChineseZodiac":
                    self.exChineseZodiac = value as? Int ?? 1
                case "exAstroSign":
                    self.exAstroSign = value as? Int ?? 1
                case "dateOfBirth":
                    self.dateOfBirth = value as? Date ?? Date()
                case "tel":
                    self.tel = value as? String ?? ""
                case "vk":
                    self.vk = value as? String ?? ""
                case "ok":
                    self.ok = value as? String ?? ""
                case "facebook":
                    self.facebook = value as? String ?? ""
                case "instagram":
                    self.instagram = value as? String ?? ""
                case "telegram":
                    self.telegram = value as? String ?? ""
                case "skype":
                    self.skype = value as? String ?? ""
                case "assistance":
                    self.assistance = value as? String ?? ""
                case "ageRange":
                    self.ageRange = value as? ClosedRange<Int> ?? 18...50
                case "selfIntro":
                    self.selfIntro = value as? String ?? ""
                case "height":
                    self.height = value as? String ?? ""
                case "weight":
                    self.weight = value as? String ?? ""
                case "previousRelationshipDate":
                    self.previousRelationshipDate = value as? Date ?? Date()
                case "photos":
                    // Assuming photos is an array of UIImage, we cannot directly cast from Any to [UIImage]
                    // You would need a specific mechanism to convert these values to UIImages, possibly involving custom serialization/deserialization
                    continue
                case "regions":
                    self.regions = value as? [EnumItem] ?? []
                case "loveLanguages":
                    self.loveLanguages = value as? [EnumItem] ?? []
                case "astroSigns":
                    self.astroSigns = value as? [EnumItem] ?? []
                case "chineseZodiacs":
                    self.chineseZodiacs = value as? [EnumItem] ?? []
                case "maritalStatuses":
                    self.maritalStatuses = value as? [EnumItem] ?? []
                case "partnerMethods":
                    self.partnerMethods = value as? [EnumItem] ?? []
                case "badHabitsList":
                    self.badHabitsList = value as? [EnumItem] ?? []
                case "hasChildrenList":
                    self.hasChildrenList = value as? [EnumItem] ?? []
                default:
                    break
                }
            }
        }
        loadEnumData()
        
    }
    
//    func serializeToJson() -> Data? {
//        guard let jsonData = try? JSONEncoder().encode(self) else { return nil }
//        return jsonData
//    }
//
//    func deserializeFromJson() {
//        if let savedData = UserDefaults.standard.data(forKey: "quizViewModelData"),
//           let savedViewModel = try? JSONDecoder().decode(QuizViewModel.self, from: savedData) {
//            self = savedViewModel
//        }
//    }
//}
}
