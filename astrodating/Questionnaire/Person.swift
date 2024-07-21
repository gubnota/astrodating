import Foundation

struct Person: Identifiable, Codable {
    let id: UUID
    let name: String
    let imageName: String
    let astrologicalSign: String
    let chineseZodiac: String
    let region: String
    let loveLanguage: String
    
    init(id: UUID = UUID(), name: String, imageName: String, astrologicalSign: String, chineseZodiac: String, region: String, loveLanguage: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.astrologicalSign = astrologicalSign
        self.chineseZodiac = chineseZodiac
        self.region = region
        self.loveLanguage = loveLanguage
    }
}
