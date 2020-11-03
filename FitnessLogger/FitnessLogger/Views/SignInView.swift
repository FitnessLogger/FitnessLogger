import Foundation
import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @State var success = false

    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        loading = true // Vis loading fra Marcus
        error = false // Måske vise en error lottie
        
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            
            if error != nil {
                self.error = true
            } else {
                success = true
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                if (error) {
                    Text("ahhh crap")
                }
                
                Button(action: signIn) {
                    Text("Sign in")
                }
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                }
            }
        }
    }
}
