import SwiftUI

struct QuizView<Content: View>: View {
    let gradient = LinearGradient(colors: [Color(hex: "#FD80C3").opacity(0.1), Color(hex: "#05B5CD").opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    @ObservedObject var viewModel: QuizViewModel
    @State private var navigateToUserList = false // State to control navigation

    let content: Content

    init(viewModel: QuizViewModel, @ViewBuilder content: () -> Content) {
        self.viewModel = viewModel
        self.content = content()
    }

    var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Rectangle().fill(gradient).ignoresSafeArea()
                    VStack {
                        Text("Шаг \(viewModel.currentStep) из 15")
                            .font(.largeTitle)
                            .padding()
                        content
                            .padding(.horizontal)
                        Spacer()
                        HStack {
                            if viewModel.currentStep > 1 {
                                Button(action: {
                                    viewModel.currentStep -= 1
                                }) {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            Image(systemName: "arrow.left")
                                                .foregroundColor(.white)
                                        )
                                }
                            }
                            Spacer() // Add spacer to push the next button to the bottom
                            Button(action: {
                                if viewModel.currentStep < 15 {
                                    viewModel.currentStep += 1
                                } else {
                                    // Finish action
                                    viewModel.currentRoute = "list"
//                                    navigateToUserList = true // Trigger navigation
                                    
                                }
                            }) {
                                Text(viewModel.currentStep < 15 ? "След" : "Завершить")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
//                            // Invisible NavigationLink that triggers navigation when navigateToListView is true
//                            NavigationLink(destination: UserListView(users: sampleUsers), isActive: $navigateToUserList) {
//                                EmptyView()
//                            }
//                            .hidden() // Hide the link itself
                        }
                        
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 50) // Adjusted frame for better control over button positioning
                        .dismissKeyboardOnTap()
                    }
                }
            }
        // Add a top safe area inset if needed Inserting a clear view to maintain proper spacing
//        .safeAreaInset(edge: .top) {Color.clear.frame(height: 0)}
//        .safeAreaInset(edge: .bottom) {Color.clear.frame(height: 0)}
}
    
}



struct CircleNumberStep: View {
    let currentStep: Int

    var body: some View {
        Circle()
            .fill(Color.black)
            .frame(width: 40, height: 40)
            .overlay(
                Text("\(currentStep)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            )
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(viewModel: QuizViewModel()) {
            VStack {
                Text("Содержимое")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
//            .safeAreaInset(edge:.top){}
//            .safeAreaInset(edge: .bottom){}
            
        }
    }
}
