//
//  Part13View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI
import PhotosUI

struct Part13View: View {
    @State private var selectedPhotos: [UIImage] = []

    var body: some View {
        VStack {
//            PhotosPicker("Select Photos", selection: $selectedPhotos, maxSelectionCount: 4, matching: .images) {
//                Text("Select Photos")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()

            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedPhotos, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .padding()

            NavigationLink(destination: Part14View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 13")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Part13View_Previews: PreviewProvider {
    static var previews: some View {
        Part13View()
    }
}
