import SwiftUI

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

let primaryColor: Color = Color.init(hex: "#05B5CD") // torquoise aquamarine
let primaryColor2: Color = Color.init(hex: "#0DD2D2")
let secondaryColor: Color = Color.init(hex: "#740BB6") // purple
let pink: Color = Color.init(hex: "#FD80C3")
let black: Color = Color.init(hex: "#282323")
let yellow: Color = Color.init(hex: "#FDF48A")
