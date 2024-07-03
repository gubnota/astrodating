import SwiftUI

struct Part8View: View {
    @State private var assistance = ""
    @State private var ageRange = 18.0...30.0

    var body: some View {
        VStack {
            Text("What kind of assistance are you looking for?")
                .padding()
            
            TextEditor(text: $assistance)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding()

            Text("Desired age range for a partner")
                .padding()

//            RangeSlider.
//            (range: $ageRange, in: 18...100)
//                .padding()

            NavigationLink(destination: Part9View()) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Part 8")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ModifiableClosedRange {
    var lowerBound: Double
    var upperBound: Double

    init(_ range: ClosedRange<Double>) {
        self.lowerBound = range.lowerBound
        self.upperBound = range.upperBound
    }

    var range: ClosedRange<Double> {
        return self.lowerBound...self.upperBound
    }
}

struct RangeSlider: View {
    @State private var modifiableRange = ModifiableClosedRange(0...100)

    var body: some View {
        VStack {
            Text("Age: \(Int(modifiableRange.lowerBound)) - \(Int(modifiableRange.upperBound))")
                .padding()

            Slider(value: $modifiableRange.lowerBound, in: 0...100, step: 1)
            Slider(value: $modifiableRange.upperBound, in: 0...100, step: 1)
        }
    }
}
struct Part8View_Previews: PreviewProvider {
    static var previews: some View {
        Part8View()
    }
}
