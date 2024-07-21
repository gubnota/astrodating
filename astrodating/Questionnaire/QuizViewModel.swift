import SwiftUI
import Combine

struct EnumItem: Identifiable, Decodable {
    let id: Int
    let name: String
}

class QuizViewModel: ObservableObject {
    @Published var currentStep: Int = 1
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var gender: Int = 1 // 1 for Male, 2 for Female
    @Published var region: Int = 77 // Default to Moscow
    @Published var astroSign: Int = 1 // ID of zodiac sign
    @Published var chineseZodiac: Int = 1 // ID of Chinese zodiac
    @Published var loveLanguage1: Int = 1 // ID from JSON
    @Published var loveLanguage2: Int = 2 // ID from JSON
    @Published var maritalStatus: Int = 1 // 1 for Single, 2 for Married
    @Published var partnerMethod: Int = 1 // ID for partner method
    @Published var badHabits: Int = 1 // ID for bad habits
    @Published var hasChildren: Int = 1 // ID for children status
    @Published var exChineseZodiac: Int = 1 // ID of ex Chinese zodiac
    @Published var exAstroSign: Int = 1 // ID of ex zodiac sign
    @Published var dateOfBirth: Date = Date()
    @Published var tel: String = ""
    @Published var vk: String = ""
    @Published var ok: String = ""
    @Published var facebook: String = ""
    @Published var instagram: String = ""
    @Published var telegram: String = ""
    @Published var skype: String = ""
    @Published var assistance: String = ""
    @Published var ageRange: ClosedRange<Int> = 18...50
    @Published var selfIntro: String = ""
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var previousRelationshipDate: Date = Date()
    @Published var photos: [UIImage] = []

    @Published var regions: [EnumItem] = []
    @Published var loveLanguages: [EnumItem] = []
    @Published var astroSigns: [EnumItem] = []
    @Published var chineseZodiacs: [EnumItem] = []
    @Published var maritalStatuses: [EnumItem] = []
    @Published var partnerMethods: [EnumItem] = []
    @Published var badHabitsList: [EnumItem] = []
    @Published var hasChildrenList: [EnumItem] = []

    init(properties: [String: Any]? = nil) {
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

    
    init() {
        loadEnumData()
    }

    private func loadEnumData() {
        if regions.isEmpty {
            loadEnum(from: "regions", to: &regions)
        }
        if loveLanguages.isEmpty {
            loadEnum(from: "loveLanguages", to: &loveLanguages)
        }
        if astroSigns.isEmpty {
            loadEnum(from: "astroSigns", to: &astroSigns)
        }
        if chineseZodiacs.isEmpty {
            loadEnum(from: "chineseZodiacs", to: &chineseZodiacs)
        }
        if maritalStatuses.isEmpty {
            loadEnum(from: "maritalStatus", to: &maritalStatuses)
        }
        if partnerMethods.isEmpty {
            loadEnum(from: "partnerMethod", to: &partnerMethods)
        }
        if badHabitsList.isEmpty {
            loadEnum(from: "badHabits", to: &badHabitsList)
        }
        if hasChildrenList.isEmpty {
            loadEnum(from: "hasChildren", to: &hasChildrenList)
        }
    }


    private func loadEnum(from fileName: String, to array: inout [EnumItem]) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            print("Loading JSON from \(url)") // Debug statement
            do {
                let data = try Data(contentsOf: url)
                let decodedItems = try JSONDecoder().decode([EnumItem].self, from: data)
                array = decodedItems
//                print("Successfully loaded \(fileName).json") // Debug statement
            } catch {
//                print("Failed to load \(fileName).json: \(error.localizedDescription)") // Debug statement
            }
        } else {
//            print("URL not found for \(fileName).json") // Debug statement
        }
    }
}
