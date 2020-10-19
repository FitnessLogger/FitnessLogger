import SwiftUI

struct MainView: View {
    @ObservedObject private var viewmodel = TrainingProgramViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                TrainingProgramView(viewmodel: viewmodel).navigationBarTitle(Text("12 - 15 reps"))
            }.tabItem {
                Image(systemName: "1.circle")
                Text("Easy")
            }.tag(0)

            
            NavigationView {
                TrainingProgramView(viewmodel: viewmodel).navigationBarTitle(Text("8 - 10 reps"))
            }.tabItem {
                Image(systemName: "2.circle")
                Text("Medium")
            }.tag(1)

            
            NavigationView {
                TrainingProgramView(viewmodel: viewmodel).navigationBarTitle(Text("3 - 5 reps"))
            }.tabItem {
                Image(systemName: "3.circle")
                Text("Hard")
            }.tag(2)
        }
    }
}
