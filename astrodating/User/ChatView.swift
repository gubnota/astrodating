//
//  ChatView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct ChatView: View {
    var person: Person
    @State private var messageText = ""
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()

            HStack {
                TextField("Enter message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding()
        }
        .navigationTitle("Chat with \(person.name)")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        messages.append(messageText)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePerson = Person(name: "Sample Person", imageName: "sampleImage", astrologicalSign: "Aries", chineseZodiac: "Dragon", region: "Moscow", loveLanguage: "Quality Time")
        ChatView(person: samplePerson)
    }
}