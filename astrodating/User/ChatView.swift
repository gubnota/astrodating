import SwiftUI
import AVFoundation
import UIKit

struct ChatView: View {
    var person: Person
    @State private var messageText = ""
    @State private var messages: [String] = []
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            ScrollView {
                Text("Привет!")
                    .padding()
                    .background(Color(hex: "#FD80C3").opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("Привет!")
                    .padding()
                    .background(Color(hex: "#05B5CD").opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color(hex: "#05B5CD").opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()

            HStack {
                TextField("Введите сообщение…", text: $messageText)
                    .styledTextField()

                Button(action: {
                    sendMessage()
                }) {
                    Text("Отправить")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .dismissKeyboardOnTap()
        .navigationTitle("Переписка")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setupAudioPlayer()
        }
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        messages.append(messageText)
        messageText = ""
        
        // Haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        // Play sound notification
        audioPlayer?.play()
    }

    private func setupAudioPlayer() {
        if let soundURL = Bundle.main.url(forResource: "notification", withExtension: "m4a") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePerson = Person(name: "Sample Person", imageName: "sampleImage", astrologicalSign: "Aries", chineseZodiac: "Dragon", region: "Moscow", loveLanguage: "Quality Time")
        ChatView(person: samplePerson)
    }
}
