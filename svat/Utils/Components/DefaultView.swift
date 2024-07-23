//
//  DefaultView.swift
//
//  Created by Vladislav Muravyev on 23.07.2024.
import SwiftUI

struct DefaultView<Content: View>: View {
    let gradient = LinearGradient(colors: [pink.opacity(0.1), primaryColor.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let content: Content

    var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Rectangle().fill(gradient).ignoresSafeArea()
                    VStack {
                        content
//                            .padding(.horizontal)

//                        }
                        
//                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 50) // Adjusted frame for better control over button positioning
                        .dismissKeyboardOnTap()
                    }
                }
            }
    }
}




struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView(content:
        VStack {
                Text("Содержимое текст")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
        )
    }
}
