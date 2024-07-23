import SwiftUI
import AVFoundation

struct ChatView: View {
    var person: Person
    @State private var messageText = ""
    @State private var messages: [String] = []
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()

            HStack {
                TextField("Enter message...", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Chat with \(person.name)")
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
        ChatView(person: samplePerson)
    }
}
