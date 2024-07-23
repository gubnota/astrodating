import SwiftUI
import AVFoundation


struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSlideIndex = 0
    @State private var isAutoPlayEnabled = false
    let totalSlides = 5
    let autoPlayInterval = 3.0
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    let leftTexts = ["ОДОБРЕНИЕ", "ВРЕМЯ", "ПОДАРКИ", "ПОМОЩЬ", "ФИЗИЧЕСКИЙ КОНТАКТ"]
    let rightTexts = ["подбадривание, комплименты, поддержка", "внимание, время проведенное вместе, поддержка", "подарки, сюрпризы, впечатления", "помощь в делах, вкусняшки", "объятия, прикосновения, поглаживания"]
    
    @StateObject private var audioPlayer = AudioPlayer()

    var body: some View {
        ZStack {
            VStack {
                // Slide selector bars at the top
                HStack {
                    ForEach(0..<totalSlides, id: \.self) { index in
                        Rectangle()
                            .fill(index == currentSlideIndex ? Color.white : Color.gray)
                            .frame(height: 5)
                    }
                }
                .padding(.horizontal)
                // .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) // Adjust padding to respect safe area
                
                TabView(selection: $currentSlideIndex) {
                    ForEach(0..<totalSlides, id: \.self) { index in
                        Slide(imageName: "p0\(index+1)", leftText: leftTexts[index], rightText: rightTexts[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            HStack(alignment: .center) {
                Button(action: {
                    // Dismiss DetailView and go back to MainView
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 64, height: 64)
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                        )
                }
                Spacer()
            }
        }
        .onReceive(timer) { _ in
            guard isAutoPlayEnabled else { return }
            self.currentSlideIndex = (self.currentSlideIndex + 1) % self.totalSlides
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // To make the background black for contrast
        .onAppear {
            audioPlayer.playSound()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}
