import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var global = ControllerRegister.global

    init() {
        
    }
    
    func getUser() {
        self.global.updateUserId(userId: UserDefaults.standard.string(forKey: "userId"))
        
        if self.global.userId != nil {
            self.session.fetchDataFromFirebase()
        }
    }

    var body: some View {
        ZStack {
            Group {
                if (global.userId != nil) {
                    TabView {
                        NavigationView {
                            TrainingProgramView().navigationBarTitle(Text("My Programs"))
                        }.tabItem {
                            Image(systemName: "1.circle")
                            Text("Programs")
                        }.tag(0)


                        NavigationView {
                            TrainingProgramView(isHistory: true).navigationBarTitle(Text("Program History"))
                        }.tabItem {
                            Image(systemName: "2.circle")
                            Text("History")
                        }.tag(1)


                        NavigationView {
                            SettingsView()
                        }.tabItem {
                            Image(systemName: "3.circle")
                            Text("Settings")
                        }.tag(2)
                    }
                } else {
                    SignInView()
                }
            }.onAppear(perform: {
                self.getUser()
            })
            
            if global.isLoading {
                BlurView(style: .light)
                LoadingView()
            }
        }
    }
}
