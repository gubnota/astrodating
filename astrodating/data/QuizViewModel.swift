import SwiftUI
import Combine

struct EnumItem: Identifiable, Decodable {
    let id: Int
    let name: String
}

class QuizViewModel: ObservableObject, Codable {//, Encodable, Decodable
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
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false

    static let userDefaultsKey = "quizViewModelData"
    
    init() {
        loadEnumData()
//        deserializeFromJson()
//        setupSaveOnChange()
    }

    func loadEnumData() {
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
    
    
    private func setupSaveOnChange() {
           let publishers: [AnyPublisher<Void, Never>] = [
               $currentStep.map { _ in () }.eraseToAnyPublisher(),
               $name.map { _ in () }.eraseToAnyPublisher(),
               $surname.map { _ in () }.eraseToAnyPublisher(),
               $gender.map { _ in () }.eraseToAnyPublisher(),
               $region.map { _ in () }.eraseToAnyPublisher(),
               $astroSign.map { _ in () }.eraseToAnyPublisher(),
               $chineseZodiac.map { _ in () }.eraseToAnyPublisher(),
               $loveLanguage1.map { _ in () }.eraseToAnyPublisher(),
               $loveLanguage2.map { _ in () }.eraseToAnyPublisher(),
               $maritalStatus.map { _ in () }.eraseToAnyPublisher(),
               $partnerMethod.map { _ in () }.eraseToAnyPublisher(),
               $badHabits.map { _ in () }.eraseToAnyPublisher(),
               $hasChildren.map { _ in () }.eraseToAnyPublisher(),
               $exChineseZodiac.map { _ in () }.eraseToAnyPublisher(),
               $exAstroSign.map { _ in () }.eraseToAnyPublisher(),
               $dateOfBirth.map { _ in () }.eraseToAnyPublisher(),
               $tel.map { _ in () }.eraseToAnyPublisher(),
               $vk.map { _ in () }.eraseToAnyPublisher(),
               $ok.map { _ in () }.eraseToAnyPublisher(),
               $facebook.map { _ in () }.eraseToAnyPublisher(),
               $instagram.map { _ in () }.eraseToAnyPublisher(),
               $telegram.map { _ in () }.eraseToAnyPublisher(),
               $skype.map { _ in () }.eraseToAnyPublisher(),
               $assistance.map { _ in () }.eraseToAnyPublisher(),
               $ageRange.map { _ in () }.eraseToAnyPublisher(),
               $selfIntro.map { _ in () }.eraseToAnyPublisher(),
               $height.map { _ in () }.eraseToAnyPublisher(),
               $weight.map { _ in () }.eraseToAnyPublisher(),
               $previousRelationshipDate.map { _ in () }.eraseToAnyPublisher(),
               $photos.map { _ in () }.eraseToAnyPublisher(),
               $username.map { _ in () }.eraseToAnyPublisher(),
               $password.map { _ in () }.eraseToAnyPublisher(),
               $isLoggedIn.map { _ in () }.eraseToAnyPublisher()
           ]

           Publishers.MergeMany(publishers)
               .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
               .sink { [weak self] in
                   self?.saveToUserDefaults()
               }
               .store(in: &cancellables)
       }
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: QuizViewModel.userDefaultsKey)
        }
    }

    public func deserializeFromJson() {
        if let savedData = UserDefaults.standard.data(forKey: QuizViewModel.userDefaultsKey) {
            if let decoded = try? JSONDecoder().decode(QuizViewModel.self, from: savedData) {
                self.currentStep = decoded.currentStep
                self.name = decoded.name
                self.surname = decoded.surname
                self.gender = decoded.gender
                self.region = decoded.region
                self.astroSign = decoded.astroSign
                self.chineseZodiac = decoded.chineseZodiac
                self.loveLanguage1 = decoded.loveLanguage1
                self.loveLanguage2 = decoded.loveLanguage2
                self.maritalStatus = decoded.maritalStatus
                self.partnerMethod = decoded.partnerMethod
                self.badHabits = decoded.badHabits
                self.hasChildren = decoded.hasChildren
                self.exChineseZodiac = decoded.exChineseZodiac
                self.exAstroSign = decoded.exAstroSign
                self.dateOfBirth = decoded.dateOfBirth
                self.tel = decoded.tel
                self.vk = decoded.vk
                self.ok = decoded.ok
                self.facebook = decoded.facebook
                self.instagram = decoded.instagram
                self.telegram = decoded.telegram
                self.skype = decoded.skype
                self.assistance = decoded.assistance
                self.ageRange = decoded.ageRange
                self.selfIntro = decoded.selfIntro
                self.height = decoded.height
                self.weight = decoded.weight
                self.previousRelationshipDate = decoded.previousRelationshipDate
                self.photos = decoded.photos
                self.username = decoded.username
                self.password = decoded.password
                self.isLoggedIn = decoded.isLoggedIn
            }
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private enum CodingKeys: String, CodingKey {
        case currentStep, name, surname, gender, region, astroSign, chineseZodiac, loveLanguage1, loveLanguage2, maritalStatus, partnerMethod, badHabits, hasChildren, exChineseZodiac, exAstroSign, dateOfBirth, tel, vk, ok, facebook, instagram, telegram, skype, assistance, ageRange, selfIntro, height, weight, previousRelationshipDate, photos, regions, loveLanguages, astroSigns, chineseZodiacs, maritalStatuses, partnerMethods, badHabitsList, hasChildrenList, username, password, isLoggedIn
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currentStep = try container.decode(Int.self, forKey: .currentStep)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
        gender = try container.decode(Int.self, forKey: .gender)
        region = try container.decode(Int.self, forKey: .region)
        astroSign = try container.decode(Int.self, forKey: .astroSign)
        chineseZodiac = try container.decode(Int.self, forKey: .chineseZodiac)
        loveLanguage1 = try container.decode(Int.self, forKey: .loveLanguage1)
        loveLanguage2 = try container.decode(Int.self, forKey: .loveLanguage2)
        maritalStatus = try container.decode(Int.self, forKey: .maritalStatus)
        partnerMethod = try container.decode(Int.self, forKey: .partnerMethod)
        badHabits = try container.decode(Int.self, forKey: .badHabits)
        hasChildren = try container.decode(Int.self, forKey: .hasChildren)
        exChineseZodiac = try container.decode(Int.self, forKey: .exChineseZodiac)
        exAstroSign = try container.decode(Int.self, forKey: .exAstroSign)
        dateOfBirth = try container.decode(Date.self, forKey: .dateOfBirth)
        tel = try container.decode(String.self, forKey: .tel)
        vk = try container.decode(String.self, forKey: .vk)
        ok = try container.decode(String.self, forKey: .ok)
        facebook = try container.decode(String.self, forKey: .facebook)
        instagram = try container.decode(String.self, forKey: .instagram)
        telegram = try container.decode(String.self, forKey: .telegram)
        skype = try container.decode(String.self, forKey: .skype)
        assistance = try container.decode(String.self, forKey: .assistance)
        ageRange = try container.decode(ClosedRange<Int>.self, forKey: .ageRange)
        selfIntro = try container.decode(String.self, forKey: .selfIntro)
        height = try container.decode(String.self, forKey: .height)
        weight = try container.decode(String.self, forKey: .weight)
        previousRelationshipDate = try container.decode(Date.self, forKey: .previousRelationshipDate)

        let photosData = try container.decode([Data].self, forKey: .photos)
        photos = photosData.compactMap { UIImage(data: $0) }

        regions = try container.decode([EnumItem].self, forKey: .regions)
        loveLanguages = try container.decode([EnumItem].self, forKey: .loveLanguages)
        astroSigns = try container.decode([EnumItem].self, forKey: .astroSigns)
        chineseZodiacs = try container.decode([EnumItem].self, forKey: .chineseZodiacs)
        maritalStatuses = try container.decode([EnumItem].self, forKey: .maritalStatuses)
        partnerMethods = try container.decode([EnumItem].self, forKey: .partnerMethods)
        badHabitsList = try container.decode([EnumItem].self, forKey: .badHabitsList)
        hasChildrenList = try container.decode([EnumItem].self, forKey: .hasChildrenList)
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        isLoggedIn = try container.decode(Bool.self, forKey: .isLoggedIn)
    }


    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentStep, forKey: .currentStep)
        try container.encode(name, forKey: .name)
        try container.encode(surname, forKey: .surname)
        try container.encode(gender, forKey: .gender)
        try container.encode(region, forKey: .region)
        try container.encode(astroSign, forKey: .astroSign)
        try container.encode(chineseZodiac, forKey: .chineseZodiac)
        try container.encode(loveLanguage1, forKey: .loveLanguage1)
        try container.encode(loveLanguage2, forKey: .loveLanguage2)
        try container.encode(maritalStatus, forKey: .maritalStatus)
        try container.encode(partnerMethod, forKey: .partnerMethod)
        try container.encode(badHabits, forKey: .badHabits)
        try container.encode(hasChildren, forKey: .hasChildren)
        try container.encode(exChineseZodiac, forKey: .exChineseZodiac)
        try container.encode(exAstroSign, forKey: .exAstroSign)
        try container.encode(dateOfBirth, forKey: .dateOfBirth)
        try container.encode(tel, forKey: .tel)
        try container.encode(vk, forKey: .vk)
        try container.encode(ok, forKey: .ok)
        try container.encode(facebook, forKey: .facebook)
        try container.encode(instagram, forKey: .instagram)
        try container.encode(telegram, forKey: .telegram)
        try container.encode(skype, forKey: .skype)
        try container.encode(assistance, forKey: .assistance)
        try container.encode(ageRange, forKey: .ageRange)
        try container.encode(selfIntro, forKey: .selfIntro)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
        try container.encode(previousRelationshipDate, forKey: .previousRelationshipDate)
//        try container.encode(photos, forKey: .photos)
//        try container.encode(regions, forKey: .regions)
//        try container.encode(loveLanguages, forKey: .loveLanguages)
//        try container.encode(astroSigns, forKey: .astroSigns)
//        try container.encode(chineseZodiacs, forKey: .chineseZodiacs)
//        try container.encode(maritalStatuses, forKey: .maritalStatuses)
//        try container.encode(partnerMethods, forKey: .partnerMethods)
//        try container.encode(badHabitsList, forKey: .badHabitsList)
//        try container.encode(hasChildrenList, forKey: .hasChildrenList)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(isLoggedIn, forKey: .isLoggedIn)
    }

}
