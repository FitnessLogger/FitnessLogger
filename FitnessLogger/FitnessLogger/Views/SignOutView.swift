import SwiftUI

struct SignOutView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        CustomTextButton(action: {
            session.signOut()
        }, label: "Sign Out")
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
