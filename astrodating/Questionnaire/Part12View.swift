import SwiftUI
import PhotosUI

struct Part12View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var isPickerPresented = false

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Выберите фотографии")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Button(action: {
                    isPickerPresented = true
                }) {
                    Text("Выбрать фотографии")
                        .frame(maxWidth: .infinity)
                        .styledPicker()
                }
                .sheet(isPresented: $isPickerPresented) {
                    PhotoPicker(photos: $viewModel.photos)
                }

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.photos, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(10)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color(hex: "#FD80C3"), lineWidth: 3)
                                )
                                .cornerRadius(4)
                        }
                    }
                }
//                .padding()
            }
        }
    }
}

struct Part12View_Previews: PreviewProvider {
    static var previews: some View {
        Part12View(viewModel: QuizViewModel())
    }
}
