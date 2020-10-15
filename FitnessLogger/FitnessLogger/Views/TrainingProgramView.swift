import Foundation
import SwiftUI

struct TrainingProgramView: View {
    @ObservedObject var viewmodel = TrainingProgramViewModel()
    @State var showingAddProgramSheet = false
    
    var body: some View {
        VStack {
            if viewmodel.trainingPrograms.isEmpty {
                Button("Add training program", action: {
                    self.showingAddProgramSheet.toggle()
                }).sheet(isPresented: $showingAddProgramSheet) {
                    let viewmodel = AddTrainingProgramViewModel()
                    AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                }
            } else {
                List(viewmodel.trainingPrograms) { trainingProgram in
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
                            let viewmodel = AddTrainingProgramViewModel()
                            AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                        }
                    }
                )
            }
        }
    }
}
