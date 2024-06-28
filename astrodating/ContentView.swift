//
//  ContentView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @State private var currentSlideIndex = 0
    @State private var isAutoPlayEnabled = false
    let totalSlides = 5
    let autoPlayInterval = 3.0
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $currentSlideIndex) {
                ForEach(0..<totalSlides, id: \.self) { index in
                    Slide(imageName: "p0\(index+1)", leftText: "Left Text \(index + 1)", rightText: "Right Text \(index + 1)")
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<totalSlides, id: \.self) { index in
                    Circle()
                        .fill(index == currentSlideIndex ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
            
            HStack {
                Button("Rewind") {
                    self.currentSlideIndex = max(0, self.currentSlideIndex - 1)
                }
                Spacer()
                Button(isAutoPlayEnabled ? "Stop" : "Play") {
                    self.isAutoPlayEnabled.toggle()
                }
                Spacer()
                Button("Skip") {
                    self.currentSlideIndex = min(self.totalSlides - 1, self.currentSlideIndex + 1)
                }
            }
            .padding()
        }
        .onReceive(timer) { _ in
            guard isAutoPlayEnabled else { return }
            self.currentSlideIndex = (self.currentSlideIndex + 1) % self.totalSlides
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
