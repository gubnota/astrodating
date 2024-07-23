import Foundation

func loadJSON<T: Decodable>(fileName: String) -> T? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
        return nil
    }
    return decodedData
}
