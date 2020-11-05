import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var global = ControllerRegister.global
    var tp: Program = Program()

    func getUser() {
        session.listen(program: tp)
    }

    var body: some View {
        ZStack {
            Group {
                if (session.session != nil) {
                    TabView {
                        NavigationView {
                            TrainingProgramView(tp: tp).navigationBarTitle(Text("My Programs"))
                        }.tabItem {
                            Image(systemName: "1.circle")
                            Text("Programs")
                        }.tag(0)


                        NavigationView {
                            TrainingProgramView(tp: tp).navigationBarTitle(Text("Program History"))
                        }.tabItem {
                            Image(systemName: "2.circle")
                            Text("History")
                        }.tag(1)


                        NavigationView {
                            SignOutView()
                        }.tabItem {
                            Image(systemName: "3.circle")
                            Text("Settings")
                        }.tag(2)
                    }
                } else {
                    SignInView()
                }
            }.onAppear(perform: {
                getUser()
            })
            
            if global.isLoading {
                BlurView(style: .light)
                LoadingView()
            }
        }
    }
}
