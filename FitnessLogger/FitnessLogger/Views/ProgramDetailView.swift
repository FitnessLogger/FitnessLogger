import Foundation
import SwiftUI

struct ProgramDetailView: View {
    var trainingProgram: TrainingProgram
    @State var showSheet: Bool = false
    @State var globalExercise: Exercise
    
    var body: some View {
        VStack {
            List(trainingProgram.exercises) { exercise in
                Button("", action: {
                    globalExercise = exercise
                    self.showSheet.toggle()
                })
                ExerciseDetailItem(exercise: globalExercise)
            }.sheet(isPresented: self.$showSheet) {
                let vm = UpdateExerciseLogViewModel(with: globalExercise)
                UpdateExerciseLogView(with: vm, show: self.$showSheet)
            }
        }
        .navigationBarTitle(Text(self.trainingProgram.name))
        .navigationBarItems(trailing: Button(action: {
            print("Edit pressed")
        }) {
            Text("Edit").bold()
        })
    }
}
