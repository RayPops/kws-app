import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding()
                
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isLoggedIn,
                    label: {
                        LoginButton()
                            .frame(width: 280, height: 45)
                            .cornerRadius(8)
                            .padding()
                    }
                )
                .navigationBarBackButtonHidden(true) // Hide the back button
                .navigationTitle("") // Hide the navigation title
                
                Spacer()
            }
        }
    }
}

struct LoginButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        // No need to update anything
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


