import SwiftUI

struct Slide: View {
    var imageName: String
    var leftText: String
    var rightText: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
            
            VStack {
                Text(leftText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                
                Spacer()
                
                Text(rightText)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 60) // Adjust the padding as necessary to position it above the bottom edge
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Slide_Previews: PreviewProvider {
    static var previews: some View {
        Slide(imageName: "p01", leftText: "Left Text", rightText: "Right Text")
    }
}
