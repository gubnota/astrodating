//
//  UserListView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 03-07-2024.
//


import SwiftUI

struct UserListView: View {
    var users: [Person]
    
    var body: some View {
            ScrollView {
                HStack {
                    Text("Кандидаты").fontWeight(.bold).font(.headline)
                    Spacer()
                    profileButton
                }
                .padding(.horizontal)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(users) { user in
                        NavigationLink(destination: PersonDetailView(person: user)) {
                            UserCardView(person: user)
                        }
                    }
                }
                .padding()
            }
//            .navigationTitle("Кандидаты")
//            .navigationBarItems(leading: Rectangle().opacity(0),trailing: profileButton)
        // Add a top safe area inset if needed Inserting a clear view to maintain proper spacing
//        .safeAreaInset(edge: .top) {Color.clear.frame(height: 0)}
//        .safeAreaInset(edge: .bottom) {Color.clear.frame(height: 0)}

    }
    
    private var profileButton: some View {
        
        return NavigationLink(destination: ProfileView(viewModel: QuizViewModel())) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .foregroundColor(.black)
        }
    }
}
    
    struct UserCardView: View {
        var person: Person
        let gradient = LinearGradient(colors: [Color(hex: "#FD80C3").opacity(0.2), Color(hex: "#05B5CD").opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        var body: some View {
            VStack {
                Image(person.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(hex: "#FD80C3"), lineWidth: 6))
                Spacer()
                Text(person.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(person.region)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(height: 260)
            .background(gradient)
            .cornerRadius(10)
        }
    }
    
    struct UserListView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
            UserListView(users: sampleUsers)
            }
            .navigationViewStyle(StackNavigationViewStyle())// make iPad version to fill up whole area
            .navigationBarHidden(true) // Hide the navigation bar
            .navigationBarTitle("", displayMode: .inline) // Set title to empty string
        }
    }

