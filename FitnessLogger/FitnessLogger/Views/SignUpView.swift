import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error = false
    @ObservedObject var global = ControllerRegister.global
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        self.global.isLoading = true
        error = false
        
        session.signUp(email: email, password: password) { (result, error) in
            self.global.isLoading = false
            
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            
            Image("FL-Banner").resizable().scaledToFit().padding([.leading, .trailing], 48)
            
            Spacer()
            
            if (error) {
                Text("Something went wrong, please try again.")
            }
            
            TextField("Email", text: $email)
                .font(.custom(Font.oswaldHeavy, size: 20))
                .multilineTextAlignment(.center)
                .padding()
            SecureField("Password", text: $password)
                .font(.custom(Font.oswaldHeavy, size: 20))
                .multilineTextAlignment(.center)
            
            CustomTextButton(action: {
                signUp()
            }, label: "Sign Up")
            .padding()
            
            Spacer()
        }.padding()
    }
}

