//
//  GradientView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI
let gradient = LinearGradient(gradient: Gradient(colors: [Color(hex: "#ed6e61").opacity(0.2), Color(hex: "#6359e1").opacity(0.2)]), startPoint: .leading, endPoint: .trailing)

struct GradientView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        GeometryReader { geometry in
        ZStack(alignment: .center) {
                // Background gradient
                Rectangle().fill(gradient).ignoresSafeArea()
            HStack {
                Spacer() // Pushes everything after it to the right
                
                CircleNumberStep(currentStep: 1) // Assuming CircleNumberStep is your custom view
                    .padding() // Adds some space around your view
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Ensures the HStack fills the screen vertically
            .edgesIgnoringSafeArea(.top) // Allows the content to go under the status bar
            
            ScrollView{
                VStack {
                Rectangle().frame(height: 10).opacity(0)
                    Picker("Пол", selection: $viewModel.gender) {
                        Text("Мужской").tag(1)
                        Text("Женский").tag(2)
                    }
                    .styledPicker()
                ForEach(0..<20) { index in
                    Text("Title \(index)")
                        .font(.largeTitle)
                        .foregroundColor(.black)

                }

                Spacer()
                
                
                    HStack{
                        Button(action: {
//                            viewModel.currentStep -= 1
                        }) {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                )
                        }
                        Rectangle().frame(width: 10).opacity(0)
                        Button(action: {
                            // Button action here
                            
                        }) {
                            Text("Button")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                Rectangle().frame(height: 10).opacity(0)
            }
                .padding(.horizontal)
                //                .frame(maxWidth: geometry.size.width-20,maxHeight:  geometry.size.height-20)
//            .background(Color.white) // Apply a grey background color
            .dismissKeyboardOnTap()
            }
//                .frame(width: geometry.size.width - 20, height: geometry.size.height - 20)
            }
            
//            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

// Preview provider for Xcode canvas
struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView(viewModel: QuizViewModel())
    }
}

