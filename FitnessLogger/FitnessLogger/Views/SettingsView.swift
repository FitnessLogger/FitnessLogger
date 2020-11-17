import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            
            Spacer()
            
            CustomTextLabel(text: "This page is ready for future development.")
            
            Spacer()
            
            CustomTextButton(action: {
                let result = session.signOut()
                print("Log out result:", result)
            }, label: "Sign Out", isClear: true).padding()
            
        }.navigationBarTitle("Settings")
        
        
    }
}
