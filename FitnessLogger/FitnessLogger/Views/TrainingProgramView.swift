import Foundation
import SwiftUI

struct TrainingProgramView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var tp: Program
    @ObservedObject var global = ControllerRegister.global
    @State var showingAddProgramSheet = false
    
    func fetchData() {
        print("Fetching data")
        self.tp.fetchDataFromFirebase()
    }
    
    var body: some View {
        VStack {
            if tp.items.isEmpty {
                Button("Add training program", action: {
                    self.showingAddProgramSheet.toggle()
                }).sheet(isPresented: $showingAddProgramSheet) {
                    let viewmodel = AddTrainingProgramViewModel(program: self.tp)
                    AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                }
                
                Button("Sign Out", action: {
                    session.signOut()
                })
            } else {
                List(self.tp.items) { trainingProgram in
                    let vm = ProgramDetailViewModel(trainingProgram: trainingProgram)
                    NavigationLink(destination: ProgramDetailView(viewmodel: vm)) {
                        TrainingProgramItem(trainingProgram: trainingProgram)
                    }
                }.navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            self.showingAddProgramSheet.toggle()
                        }) {
                            Image(systemName: "plus").imageScale(.large)
                        }.sheet(isPresented: $showingAddProgramSheet) {
                            let viewmodel = AddTrainingProgramViewModel(program: self.tp)
                            AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                        }
                    }
                )
            }
        }.onAppear {
            fetchData()
        }
    }
}
