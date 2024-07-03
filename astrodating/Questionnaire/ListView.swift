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
