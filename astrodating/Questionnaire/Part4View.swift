import SwiftUI

struct Part4View: View {
    @State private var selectedLoveLanguage = ""

    var body: some View {
        VStack {
            Text("Select your main love language")
                .font(.title2)
                .padding()

            Picker("Love Language", selection: $selectedLoveLanguage) {
                ForEach(loveLanguages, id: \.self) { language in
                    Text(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: ContentView()) {
                Text("Show Initial Content")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: Part5View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 4")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let loveLanguages = ["Approval", "Time", "Help", "Presents"]

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
