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
}