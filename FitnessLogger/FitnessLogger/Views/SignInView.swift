import Foundation
import SwiftUI

struct SignInView: View {
    
    @State var email: String = "J@t.dk"
    @State var password: String = "hejmeddig"
    @State var error = false
    @ObservedObject var global = ControllerRegister.global
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        self.global.updateLoadingState(isLoading: true)
        error = false
        
        session.signIn(email: email, password: password) { (result, error) in
            if error != nil {
                self.error = true
                self.global.updateLoadingState(isLoading: false)
            } else {
                self.global.updateUserId(userId: result?.user.uid)
                self.session.fetchDataFromFirebase()
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                
                Image("FL-Banner").resizable().scaledToFit().padding([.leading, .trailing], 48)
                
                Spacer()
                
                if (error) {
                    CustomTextLabel(text: "Something went wrong, please try again.")
                }
                
                TextField("Email", text: $email)
                    .font(.custom(Font.oswaldHeavy, size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                SecureField("Password", text: $password)
                    .font(.custom(Font.oswaldHeavy, size: 20))
                    .multilineTextAlignment(.center)
                
                CustomTextButton(action: {
                    signIn()
                }, label: "Sign In")
                .padding()
                
                Spacer()
                
                NavigationButton(destination: SignUpView(), content: "Sign Up", isClear: true)
                    .padding(.top, 8)
            }.padding()
        }
    }
}
