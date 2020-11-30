import Foundation
import SwiftUI

struct ProgramDetailView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject private var vm: ProgramDetailViewModel
    
    init(viewmodel: ProgramDetailViewModel) {
        self.vm = viewmodel
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(self.vm.trainingProgram.exercises) { exercise in
                    if vm.isHistory {
                        let vm = BarChartViewModel(exercice: exercise)
                        NavigationLink(destination: BarChartView(viewModel: vm)) {
                            ExerciseDetailItem(exercise: exercise)
                        }
                    }
                    else {
                        Button {
                            self.vm.exercise = exercise
                            if !vm.isHistory {
                                self.vm.showSheet.toggle()
                            }
                        } label: {
                            ExerciseDetailItem(exercise: exercise)
                        }
                    }
                }
            }.sheet(isPresented: self.$vm.showSheet) {
                let vm = UpdateExerciseLogViewModel(with: self.vm.exercise!, for: self.vm.trainingProgram)
                UpdateExerciseLogView(with: vm, show: self.$vm.showSheet)
            }
        }
        .navigationBarTitle(Text(self.vm.trainingProgram.name))
        .navigationBarItems(trailing:
            HStack {
            if !vm.isHistory {
                Button(action: {
                    self.vm.showProgramSheet.toggle()
                }) {
                    Text("Edit").bold()
                }.sheet(isPresented: self.$vm.showProgramSheet) {
                    let viewmodel = AddTrainingProgramViewModel(programs: self.session.programs, trainingProgram: self.vm.trainingProgram)
                    AddTrainingProgramView(viewmodel: viewmodel, show: self.$vm.showProgramSheet, editMode: true)
                }
            }
        })
    }
}
