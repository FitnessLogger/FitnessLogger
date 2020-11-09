import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            
            Spacer()
            
            CustomTextLabel(text: "This page is ready for future development.")
            
            Spacer()
            
            CustomTextButton(action: {
                session.signOut()
            }, label: "Sign Out", isClear: true).padding()
            
        }.navigationBarTitle("Settings")
        
        
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
