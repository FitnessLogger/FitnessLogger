import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore

    var tp: Program = Program()
    @ObservedObject var global = ControllerRegister.global

    func getUser() {
        print("Started listening")
        session.listen()
    }

    var body: some View {
        ZStack {
            Group {
                if (session.session != nil) {
                    TabView {
                        NavigationView {
                            TrainingProgramView(tp: tp).navigationBarTitle(Text("12 - 15 reps"))
                        }.tabItem {
                            Image(systemName: "1.circle")
                            Text("Easy")
                        }.tag(0)


                        NavigationView {
                            TrainingProgramView(tp: tp).navigationBarTitle(Text("8 - 10 reps"))
                        }.tabItem {
                            Image(systemName: "2.circle")
                            Text("Medium")
                        }.tag(1)


                        NavigationView {
                            TrainingProgramView(tp: tp).navigationBarTitle(Text("3 - 5 reps"))
                        }.tabItem {
                            Image(systemName: "3.circle")
                            Text("Hard")
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
