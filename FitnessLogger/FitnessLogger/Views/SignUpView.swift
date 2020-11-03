import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        loading = true // Vis loading fra Marcus
        error = false // Måske vise en error lottie
        
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            
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
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            if (error) {
                Text("ahhh crap")
            }
            Button(action: signUp) {
                Text("Sign Up")
            }
        }
    }
}

