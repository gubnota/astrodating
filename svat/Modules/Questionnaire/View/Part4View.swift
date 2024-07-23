import SwiftUI

struct Part4View: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var showDetail = false

    var body: some View {
        QuizView(viewModel: viewModel) {
            VStack {
                Text("Выберите основные языки любви")
                    .font(.title)
                    .lineLimit(3)
                    .padding()

                Picker("Первый язык любви", selection: $viewModel.loveLanguage1) {
                    ForEach(viewModel.loveLanguages) { language in
                        Text(language.name).tag(language.id)
                    }
                }
                .styledPicker()

                Picker("Второй язык любви", selection: $viewModel.loveLanguage2) {
                    ForEach(viewModel.loveLanguages) { language in
                        Text(language.name).tag(language.id)
                    }
                }
                .styledPicker()
                Spacer().frame(height: 50)
                Button (action: {showDetail.toggle()}) {
                    Text("Что такое языки любви?")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(pink)
                        .foregroundColor(.black)
                        
                        .cornerRadius(10)
                }

                if showDetail {
                    NavigationLink(destination: ContentView(), isActive: $showDetail) {
                        EmptyView()
                    }
                    .hidden()
                }
//                    NavigationLink {
//                    ContentView()
//                } label: {
//                    Text("Что такое языки любви?").fontWeight(.bold).foregroundColor(.black)
//                }

            }
            .padding(.horizontal)
        }
    }
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View(viewModel: QuizViewModel())
    }
}
