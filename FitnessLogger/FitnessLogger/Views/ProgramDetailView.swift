import Foundation
import SwiftUI

struct ProgramDetailView: View {
    @ObservedObject private var vm: ProgramDetailViewModel
    
    init(viewmodel: ProgramDetailViewModel) {
        self.vm = viewmodel
    }
    
    var body: some View {
        VStack {
            List(self.vm.trainingProgram.exercises) { exercise in
                Button("", action: {
                    self.vm.exercise = exercise
                    self.vm.showSheet.toggle()
                })
                ExerciseDetailItem(exercise: exercise)
            }.sheet(isPresented: self.$vm.showSheet) {
                let vm = UpdateExerciseLogViewModel(with: self.vm.exercise!)
                UpdateExerciseLogView(with: vm, show: self.$vm.showSheet)
            }
        }
        .navigationBarTitle(Text(self.vm.trainingProgram.name))
        .navigationBarItems(trailing: Button(action: {
            self.vm.showProgramSheet.toggle()
        }) {
            Text("Edit").bold()
        }.sheet(isPresented: self.$vm.showProgramSheet) {
            let viewmodel = AddTrainingProgramViewModel(trainingProgram: self.vm.trainingProgram)
            AddTrainingProgramView(viewmodel: viewmodel, show: self.$vm.showProgramSheet)
        })
    }
}
