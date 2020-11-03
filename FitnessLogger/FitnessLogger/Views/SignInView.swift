import Foundation
import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error = false
    @ObservedObject var global = ControllerRegister.global
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        self.global.isLoading = true
        error = false
        
        session.signIn(email: email, password: password) { (result, error) in
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
        NavigationView {
            VStack(alignment: .center) {
                if (error) {
                    Text("Something went wrong, please try again.")
                }
                
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                CustomTextButton(action: {
                    signIn()
                }, label: "Sign In")
                
                NavigationLink(destination: SignUpView()) {
                    CustomTextLabel(text: "Sign Up")
                }
            }.padding()
        }
    }
}
